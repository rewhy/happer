.class final Landroid/support/v7/widget/ActivityChooserModel$PersistHistoryAsyncTask;
.super Landroid/os/AsyncTask;
.source "ActivityChooserModel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/widget/ActivityChooserModel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "PersistHistoryAsyncTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Object;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Landroid/support/v7/widget/ActivityChooserModel;


# direct methods
.method constructor <init>(Landroid/support/v7/widget/ActivityChooserModel;)V
    .registers 2

    iput-object p1, p0, Landroid/support/v7/widget/ActivityChooserModel$PersistHistoryAsyncTask;->this$0:Landroid/support/v7/widget/ActivityChooserModel;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    invoke-virtual {p0, p1}, Landroid/support/v7/widget/ActivityChooserModel$PersistHistoryAsyncTask;->doInBackground([Ljava/lang/Object;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method public varargs doInBackground([Ljava/lang/Object;)Ljava/lang/Void;
    .registers 13

    const/4 v0, 0x0

    aget-object v1, p1, v0

    check-cast v1, Ljava/util/List;

    const/4 v2, 0x1

    aget-object p1, p1, v2

    check-cast p1, Ljava/lang/String;

    const/4 v3, 0x0

    :try_start_b
    iget-object v4, p0, Landroid/support/v7/widget/ActivityChooserModel$PersistHistoryAsyncTask;->this$0:Landroid/support/v7/widget/ActivityChooserModel;

    iget-object v4, v4, Landroid/support/v7/widget/ActivityChooserModel;->mContext:Landroid/content/Context;

    invoke-virtual {v4, p1, v0}, Landroid/content/Context;->openFileOutput(Ljava/lang/String;I)Ljava/io/FileOutputStream;

    move-result-object v4
    :try_end_13
    .catch Ljava/io/FileNotFoundException; {:try_start_b .. :try_end_13} :catch_e8

    invoke-static {}, Landroid/util/Xml;->newSerializer()Lorg/xmlpull/v1/XmlSerializer;

    move-result-object p1

    :try_start_17
    invoke-interface {p1, v4, v3}, Lorg/xmlpull/v1/XmlSerializer;->setOutput(Ljava/io/OutputStream;Ljava/lang/String;)V

    const-string v5, "UTF-8"

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    invoke-interface {p1, v5, v6}, Lorg/xmlpull/v1/XmlSerializer;->startDocument(Ljava/lang/String;Ljava/lang/Boolean;)V

    const-string v5, "historical-records"

    invoke-interface {p1, v3, v5}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v5

    const/4 v6, 0x0

    :goto_2d
    if-ge v6, v5, :cond_63

    invoke-interface {v1, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/support/v7/widget/ActivityChooserModel$HistoricalRecord;

    const-string v8, "historical-record"

    invoke-interface {p1, v3, v8}, Lorg/xmlpull/v1/XmlSerializer;->startTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    const-string v8, "activity"

    iget-object v9, v7, Landroid/support/v7/widget/ActivityChooserModel$HistoricalRecord;->activity:Landroid/content/ComponentName;

    invoke-virtual {v9}, Landroid/content/ComponentName;->flattenToString()Ljava/lang/String;

    move-result-object v9

    invoke-interface {p1, v3, v8, v9}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    const-string v8, "time"

    iget-wide v9, v7, Landroid/support/v7/widget/ActivityChooserModel$HistoricalRecord;->time:J

    invoke-static {v9, v10}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v9

    invoke-interface {p1, v3, v8, v9}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    const-string v8, "weight"

    iget v7, v7, Landroid/support/v7/widget/ActivityChooserModel$HistoricalRecord;->weight:F

    invoke-static {v7}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object v7

    invoke-interface {p1, v3, v8, v7}, Lorg/xmlpull/v1/XmlSerializer;->attribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    const-string v7, "historical-record"

    invoke-interface {p1, v3, v7}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    add-int/lit8 v6, v6, 0x1

    goto :goto_2d

    :cond_63
    const-string v0, "historical-records"

    invoke-interface {p1, v3, v0}, Lorg/xmlpull/v1/XmlSerializer;->endTag(Ljava/lang/String;Ljava/lang/String;)Lorg/xmlpull/v1/XmlSerializer;

    invoke-interface {p1}, Lorg/xmlpull/v1/XmlSerializer;->endDocument()V
    :try_end_6b
    .catch Ljava/lang/IllegalArgumentException; {:try_start_17 .. :try_end_6b} :catch_bb
    .catch Ljava/lang/IllegalStateException; {:try_start_17 .. :try_end_6b} :catch_99
    .catch Ljava/io/IOException; {:try_start_17 .. :try_end_6b} :catch_77
    .catchall {:try_start_17 .. :try_end_6b} :catchall_75

    iget-object p1, p0, Landroid/support/v7/widget/ActivityChooserModel$PersistHistoryAsyncTask;->this$0:Landroid/support/v7/widget/ActivityChooserModel;

    iput-boolean v2, p1, Landroid/support/v7/widget/ActivityChooserModel;->mCanReadHistoricalData:Z

    if-eqz v4, :cond_dd

    :goto_71
    :try_start_71
    invoke-virtual {v4}, Ljava/io/FileOutputStream;->close()V
    :try_end_74
    .catch Ljava/io/IOException; {:try_start_71 .. :try_end_74} :catch_dd

    goto :goto_dd

    :catchall_75
    move-exception p1

    goto :goto_de

    :catch_77
    move-exception p1

    :try_start_78
    sget-object v0, Landroid/support/v7/widget/ActivityChooserModel;->LOG_TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Error writing historical record file: "

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, p0, Landroid/support/v7/widget/ActivityChooserModel$PersistHistoryAsyncTask;->this$0:Landroid/support/v7/widget/ActivityChooserModel;

    iget-object v5, v5, Landroid/support/v7/widget/ActivityChooserModel;->mHistoryFileName:Ljava/lang/String;

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_92
    .catchall {:try_start_78 .. :try_end_92} :catchall_75

    iget-object p1, p0, Landroid/support/v7/widget/ActivityChooserModel$PersistHistoryAsyncTask;->this$0:Landroid/support/v7/widget/ActivityChooserModel;

    iput-boolean v2, p1, Landroid/support/v7/widget/ActivityChooserModel;->mCanReadHistoricalData:Z

    if-eqz v4, :cond_dd

    goto :goto_71

    :catch_99
    move-exception p1

    :try_start_9a
    sget-object v0, Landroid/support/v7/widget/ActivityChooserModel;->LOG_TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Error writing historical record file: "

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, p0, Landroid/support/v7/widget/ActivityChooserModel$PersistHistoryAsyncTask;->this$0:Landroid/support/v7/widget/ActivityChooserModel;

    iget-object v5, v5, Landroid/support/v7/widget/ActivityChooserModel;->mHistoryFileName:Ljava/lang/String;

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_b4
    .catchall {:try_start_9a .. :try_end_b4} :catchall_75

    iget-object p1, p0, Landroid/support/v7/widget/ActivityChooserModel$PersistHistoryAsyncTask;->this$0:Landroid/support/v7/widget/ActivityChooserModel;

    iput-boolean v2, p1, Landroid/support/v7/widget/ActivityChooserModel;->mCanReadHistoricalData:Z

    if-eqz v4, :cond_dd

    goto :goto_71

    :catch_bb
    move-exception p1

    :try_start_bc
    sget-object v0, Landroid/support/v7/widget/ActivityChooserModel;->LOG_TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Error writing historical record file: "

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, p0, Landroid/support/v7/widget/ActivityChooserModel$PersistHistoryAsyncTask;->this$0:Landroid/support/v7/widget/ActivityChooserModel;

    iget-object v5, v5, Landroid/support/v7/widget/ActivityChooserModel;->mHistoryFileName:Ljava/lang/String;

    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_d6
    .catchall {:try_start_bc .. :try_end_d6} :catchall_75

    iget-object p1, p0, Landroid/support/v7/widget/ActivityChooserModel$PersistHistoryAsyncTask;->this$0:Landroid/support/v7/widget/ActivityChooserModel;

    iput-boolean v2, p1, Landroid/support/v7/widget/ActivityChooserModel;->mCanReadHistoricalData:Z

    if-eqz v4, :cond_dd

    goto :goto_71

    :catch_dd
    :cond_dd
    :goto_dd
    return-object v3

    :goto_de
    iget-object v0, p0, Landroid/support/v7/widget/ActivityChooserModel$PersistHistoryAsyncTask;->this$0:Landroid/support/v7/widget/ActivityChooserModel;

    iput-boolean v2, v0, Landroid/support/v7/widget/ActivityChooserModel;->mCanReadHistoricalData:Z

    if-eqz v4, :cond_e7

    :try_start_e4
    invoke-virtual {v4}, Ljava/io/FileOutputStream;->close()V
    :try_end_e7
    .catch Ljava/io/IOException; {:try_start_e4 .. :try_end_e7} :catch_e7

    :catch_e7
    :cond_e7
    throw p1

    :catch_e8
    move-exception v0

    sget-object v1, Landroid/support/v7/widget/ActivityChooserModel;->LOG_TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Error writing historical record file: "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-object v3
.end method
