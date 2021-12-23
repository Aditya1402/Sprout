from flask import Flask, request, jsonify
import pandas as pd


app = Flask(__name__)

@app.route('/api', methods = ['GET'])
def returnascii():
    d = {}
    temp = float(request.args['temperature'])
    df = pd.read_csv("dataset_sprout.csv")


    flowers = []
    for x in range(1,158):
        if ((temp >= (df.loc[x,"MinTemp"])) and (temp <= (df.loc[x,"MaxTemp"]))):
            flowers.append(df.loc[x,"Name"])

    d['output'] = flowers
    return d



if __name__ =="__main__":
    app.run()

