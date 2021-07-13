from flask import Flask ,request, jsonify
import wikipedia

app = Flask(__name__)

@app.route("/")
def hello():
    return "Namaskara Dear friends"

# @app.route("/one")
# def hello_1():
#     return "How are you"

# @app.route("/two")
# def hello_2():
#     return "if you are seeing "

# @app.route("/three")
# def hello_3():
#     return "pakka your code works "

# @app.route("/<name>")
# def printname(name):
#     return "Hey, I know you! You're {}".format(name)

test_wiki=[
    {
        'id':1,
        'title':'Inception',
        'description': wikipedia.summary('inception',sentences=2,auto_suggest=False)
    }
]

@app.route("/wikisearch",methods=["GET","POST"])
def search_stuff():
    global test_wiki
    if request.method =='GET':
        return jsonify(test_wiki)
    
    if request.method == 'POST':
        #new_id = test_wiki[-1]['id']+1
        # new_title = request.form['title']
        new_title= request.json['title']
        new_desc = wikipedia.summary(new_title,sentences=2,auto_suggest=False)

        new_obj= {
        'title':new_title,
        'description': new_desc
        }

        # test_wiki.append(new_obj)

        return jsonify(new_obj), 201


if __name__=="__main__":
    app.run(host='0.0.0.0',debug=True)