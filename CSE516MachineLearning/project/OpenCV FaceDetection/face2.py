import cv2
import sys
import math

cascPath = sys.argv[1]
cascPath2 = sys.argv[2]
faceCascade = cv2.CascadeClassifier(cascPath)
eyeCascade = cv2.CascadeClassifier(cascPath2)

video_capture = cv2.VideoCapture(0)

while True:
    # Capture frame-by-frame
    ret, frame = video_capture.read()

    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)

    faces = faceCascade.detectMultiScale(
        gray,
        scaleFactor=1.1,
        minNeighbors=5,
        minSize=(30, 30),
        flags=cv2.cv.CV_HAAR_SCALE_IMAGE
    )

    # Draw a rectangle around the faces
    for (x,y,w,h) in faces:
        #cv2.rectangle(frame,(x,y),(x+w,y+h),(255,0,0),2)
        cv2.ellipse(frame, (x+(w/2), y + (h/2)), (w/2,int(h/1.5)), 0, 0, 360, (0,0,255), 2)
        #cv2.circle(frame, (x+(w/2), y + (h/2)), int((h+w)/3), (255,0,0), 1, 8, 0) 
        roi_gray = gray[y:y+h, x:x+w]
        roi_color = frame[y:y+h, x:x+w]
        eyes = eyeCascade.detectMultiScale(roi_gray)
        for (ex,ey,ew,eh) in eyes:
            #cv2.rectangle(roi_color,(ex,ey),(ex+ew,ey+eh),(0,255,0),2)
            #cv2.circle(roi_color, (ex+(ew/2), ey + (eh/2)), int((eh+ew)/3),(0,255,0), 1, 8, 0)
            cv2.ellipse(roi_color, (ex+(ew/2), ey + (eh/2)), (int(ew/1.5),eh/2), 0, 0, 360, (0,255,0), 2)

    # Display the resulting frame
    cv2.imshow('Video', frame)

    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

# When everything is done, release the capture
video_capture.release()
cv2.destroyAllWindows()
