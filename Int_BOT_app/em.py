import cv2
from keras.models import model_from_json
from keras.preprocessing import image
from keras.preprocessing.image import ImageDataGenerator
import requests
import numpy as np
import face_recognition
import argparse
import pickle
import cv2
model = model_from_json(open(r"E:\ekc\New folder\Int_BOT\Int_BOT_app\facial_expression_model_structure.json", "r").read())
model.load_weights(r'E:\ekc\New folder\Int_BOT\Int_BOT_app\facial_expression_model_weights.h5') # load weights
face_cascade = cv2.CascadeClassifier(r'E:\ekc\New folder\Int_BOT\Int_BOT_app\haarcascade_frontalface_default.xml')
cap = cv2.VideoCapture(0)
ip="192.168.29.18"
def camclick(uid):
    print(uid,"---------------+++++++++++++++++++_______")
    i=0
    while(True):
        ret, img = cap.read()

        # img = cv2.imread('../11.jpg')
        # cv2.imwrite(str(i)+".jpg",img)


        cv2.imwrite("a.jpg", img)
        i=i+1

        detected_name = []
        # idddss = imagepath.split('/')

        ap = argparse.ArgumentParser()

        data = pickle.loads(open(r'faces.pickles', "rb").read())

        # load the input image and convert it from BGR to RGB
        imagepath = "a.jpg"
        image2 = cv2.imread(imagepath)
        # print(image)
        h, w, ch = image2.shape

        rgb = cv2.cvtColor(image2, cv2.COLOR_BGR2RGB)

        # detect the (x, y)-coordinates of the bounding boxes corresponding
        # to each face in the input image, then compute the facial embeddings
        # for each face

        boxes = face_recognition.face_locations(rgb,
                                                model='hog', )
        encodings = face_recognition.face_encodings(rgb, boxes)

        # initialize the list of names for each face detected
        names = []
        name=""
        type=""

        # loop over the facial embeddings
        for encoding in encodings:
            # attempt to match each face in the input image to our known
            # encodings
            matches = face_recognition.compare_faces(data["encodings"],
                                                     encoding, tolerance=0.65)
            name = "Unknown"
            print(matches)

            # check to see if we have found a match
            if True in matches:
                # find the indexes of all matched faces then initialize a
                # dictionary to count the total number of times each face
                # was matched
                matchedIdxs = [i for (i, b) in enumerate(matches) if b]
                counts = {}

                # loop over the matched indexes and maintain a count for
                # each recognized face face
                for i in matchedIdxs:

                    name = data["names"][i]
                    type = data["type"][i]
                    counts[name] = counts.get(name, 0) + 1
                    # print(name, "================")
                    if name not in detected_name:
                        detected_name.append(name)
                print(counts, " rount ")
                # determine the recognized face with the largest number of
                # votes (note: in the event of an unlikely tie Python will
                # select first entry in the dictionary)

                name = max(counts, key=counts.get)
                print("result1111111", name,type)

        gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)

        faces = face_cascade.detectMultiScale(gray, 1.3, 5)

        # print(faces) #locations of detected faces
        emotion = ""

        for (x, y, w, h) in faces:
            cv2.rectangle(img, (x, y), (x + w, y + h), (255, 0, 0), 2)  # draw rectangle to main image

            detected_face = img[int(y):int(y + h), int(x):int(x + w)]  # crop detected face
            detected_face = cv2.cvtColor(detected_face, cv2.COLOR_BGR2GRAY)  # transform to gray scale
            detected_face = cv2.resize(detected_face, (48, 48))  # resize to 48x48

            img_pixels = image.img_to_array(detected_face)
            img_pixels = np.expand_dims(img_pixels, axis=0)

            img_pixels /= 255  # pixels are in scale of [0, 255]. normalize all pixels in scale of [0, 1]

            predictions = model.predict(img_pixels)  # store probabilities of 7 expressions

            # find max indexed array 0: angry, 1:disgust, 2:fear, 3:happy, 4:sad, 5:surprise, 6:neutral
            max_index = np.argmax(predictions[0])

            emotion = emotions[max_index]
            cv2.putText(img, emotion, (x, y - 5), cv2.FONT_HERSHEY_SIMPLEX, 0.5, (255, 0, 0), 2)
            print(emotion)





            # if cv2.waitKey(1):
        # cv2.imshow('img', img)
        # ____________________________________attendance______________________________________________________________

        if cv2.waitKey(1) & 0xFF == ord('q'):  # press q to quit
            break

        # kill open cv things
    cap.release()
    cv2.destroyAllWindows()
            # 	pass
        # return emotion
            #write emotion text above rectangle

