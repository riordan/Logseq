---
kindle-sync:
  bookId: '47665'
  title: >-
    Building Machine Learning Pipelines: Automating Model Life Cycles with
    TensorFlow
  author: Hannes Hapke and Catherine Nelson
  asin: B08CXDBWTX
  lastAnnotatedDate: '2020-09-04'
  bookImageUrl: 'https://m.media-amazon.com/images/I/81Vimh5phfL._SY160.jpg'
  highlightsCount: 21
---
# Building Machine Learning Pipelines
## Metadata
* Author: [Hannes Hapke and Catherine Nelson](https://www.amazon.com/Hannes-Hapke/e/B07PV6Z58H/ref=dp_byline_cont_ebooks_1)
* ASIN: B08CXDBWTX
* ISBN: 978-1492053194
* Reference: https://www.amazon.com/dp/B08CXDBWTX
* [Kindle link](kindle://book?action=open&asin=B08CXDBWTX)

## Highlights
On the flip side, setting up an assembly line can be a long and costly process. And it’s not ideal if you want to produce small quantities or highly customized products. — location: [64](kindle://book?action=open&asin=B08CXDBWTX&location=64) ^ref-42131

---
the training data itself must be treated as code (e.g., versioned). — location: [73](kindle://book?action=open&asin=B08CXDBWTX&location=73) ^ref-1439

---
the behavior of a model is often quite opaque: it may pass all the tests on some data but fail entirely on others. So you must ensure that your tests cover all the data domains on which your model will be used in production. — location: [75](kindle://book?action=open&asin=B08CXDBWTX&location=75) ^ref-43979

---
most data science projects that aim to deploy models into production do not have the luxury of a large team. This makes it difficult to build an entire pipeline in-house from scratch. It may mean that machine learning projects turn into one-off efforts where performance degrades after time, the data scientist spends much of their time fixing errors when the underlying data changes, or the model is not used widely. An automated, reproducible pipeline reduces the effort required to deploy a model. — location: [114](kindle://book?action=open&asin=B08CXDBWTX&location=114) ^ref-34472

The same could be said about audio algorithms .

---
Automated machine learning pipelines will free up data scientists from maintaining existing models. We have observed too many data scientists spending their days on keeping previously developed models up to date. They run scripts manually to preprocess their training data, they write one-off deployment scripts, or they manually tune their models. — location: [264](kindle://book?action=open&asin=B08CXDBWTX&location=264) ^ref-61503

---
In manual machine learning workflows, a common source of bugs is a change in the preprocessing step after a model was trained. — location: [271](kindle://book?action=open&asin=B08CXDBWTX&location=271) ^ref-65090

---
Standardized machine learning pipelines improve the experience of a data science team. Due to the standardized setups, data scientists can be onboarded quickly or move across teams and find the same development environments. This improves efficiency and reduces the time spent getting set up on a new project. — location: [279](kindle://book?action=open&asin=B08CXDBWTX&location=279) ^ref-40222

---
More development time for novel models Simpler processes to update existing models Less time spent to reproduce models — location: [284](kindle://book?action=open&asin=B08CXDBWTX&location=284) ^ref-29481

---
not every data science project needs a pipeline. Sometimes data scientists simply want to experiment with a new model, investigate a new model architecture, or reproduce a recent publication. Pipelines wouldn’t be useful in these cases. — location: [293](kindle://book?action=open&asin=B08CXDBWTX&location=293) ^ref-60328

---
While it might seem cumbersome at first to learn a new tool (e.g., Beam or Airflow) or a new framework (e.g., Kubeflow) and set up an additional machine learning infrastructure (e.g., Kubernetes), the time investment will pay off very soon. By not adopting standardized machine learning pipelines, data science teams will face unique project setups, arbitrary log file locations, unique debugging steps, etc. The list of complications can be endless. — location: [410](kindle://book?action=open&asin=B08CXDBWTX&location=410) ^ref-33656

---
But for this book, the model architecture is a very minor point. This book is all about what you can do with your model once you have it. — location: [453](kindle://book?action=open&asin=B08CXDBWTX&location=453) ^ref-55421

This is our current opportunity with nottebooks for MLEs

---
TFX? — location: [487](kindle://book?action=open&asin=B08CXDBWTX&location=487) ^ref-13714

Tfx = beam for ml orchestragtion and scaling. Cut down on boilerplate 

---
The components of TFX “communicate” through metadata; instead of passing artifacts directly between the pipeline components, the components consume and publish references to pipeline artifacts. An artifact could be, for example, a raw dataset, a transform graph, or an exported model. — location: [549](kindle://book?action=open&asin=B08CXDBWTX&location=549) ^ref-14332

---
Designing and implementing machine learning pipelines can be frustrating at times. It is sometimes challenging to debug components within a pipeline, for example. — location: [568](kindle://book?action=open&asin=B08CXDBWTX&location=568) ^ref-56519

---
demonstrate its implementations through an interactive pipeline. The pipeline runs in a Jupyter Notebook, and the components’ artifacts can be immediately reviewed. Once you have confirmed the full functionality of your pipeline, in Chapters 11 and 12, we discuss how you can convert your interactive pipeline to a production-ready pipeline, — location: [571](kindle://book?action=open&asin=B08CXDBWTX&location=571) ^ref-18627

---
Any interactive pipeline is programmed in the context of a Jupyter Notebook or a Google Colab session. — location: [574](kindle://book?action=open&asin=B08CXDBWTX&location=574) ^ref-37925

---
Apache Beam can be used to describe batch processes, streaming operations, and data pipelines. — location: [631](kindle://book?action=open&asin=B08CXDBWTX&location=631) ^ref-50826

I supposse thesenare actually three different things, with pipelinees being the chainin of  these  things together 

---
As an example, we’ll introduce how to run TFDV on Google Cloud’s product Dataflow. TFDV runs on Apache Beam, which makes a switch to GCP Dataflow very easy. — location: [1605](kindle://book?action=open&asin=B08CXDBWTX&location=1605) ^ref-32533

This will be a game-changer when combined with Dataflow Dataframes in notebooks. 

Imgine spinning up a  local notebook, then writing a super simple single map operation over a df or joining a  df and working in interactive beam the whole time.

in theory the only things we would needx to provide would be environmennts with right package dependenncies, wrapper paackage likee bqt ford invoking amd taking advangte of ddataflow 

---
Data scientists might see the preprocessing steps expressed as TensorFlow operations (operations) as too much overhead. After all, it requires different implementations than you might be used to when you write your preprocessing step with Python’s pandas or numpy. We aren’t advocating the use of TFT during the experimentation phase. — location: [1723](kindle://book?action=open&asin=B08CXDBWTX&location=1723) ^ref-32315

---
converting your preprocessing steps to TensorFlow operations when you bring your machine learning model to a production environment will help avoid training-serving skews — location: [1726](kindle://book?action=open&asin=B08CXDBWTX&location=1726) ^ref-20682

---
tft.apply_saved_model() This function lets you apply entire TensorFlow models on a feature. We can load a saved model with a given tag and signature_name and then the inputs will be passed to the model. The predictions from the model execution will then be returned. — location: [1884](kindle://book?action=open&asin=B08CXDBWTX&location=1884) ^ref-22267

Could we do this for stem separation as a preprocessing step? Could this be how we get a running library of audio features

---
