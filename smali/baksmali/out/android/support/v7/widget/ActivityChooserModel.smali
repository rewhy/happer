.class Landroid/support/v7/widget/ActivityChooserModel;
.super Landroid/database/DataSetObservable;
.source "ActivityChooserModel.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v7/widget/ActivityChooserModel$PersistHistoryAsyncTask;,
        Landroid/support/v7/widget/ActivityChooserModel$DefaultSorter;,
        Landroid/support/v7/widget/ActivityChooserModel$ActivityResolveInfo;,
        Landroid/support/v7/widget/ActivityChooserModel$HistoricalRecord;,
        Landroid/support/v7/widget/ActivityChooserModel$OnChooseActivityListener;,
        Landroid/support/v7/widget/ActivityChooserModel$ActivitySorter;,
        Landroid/support/v7/widget/ActivityChooserModel$ActivityChooserModelClient;
    }
.end annotation


# static fields
.field static final ATTRIBUTE_ACTIVITY:Ljava/lang/String; = "activity"

.field static final ATTRIBUTE_TIME:Ljava/lang/String; = "time"

.field static final ATTRIBUTE_WEIGHT:Ljava/lang/String; = "weight"

.field static final DEBUG:Z = false

.field private static final DEFAULT_ACTIVITY_INFLATION:I = 0x5

.field private static final DEFAULT_HISTORICAL_RECORD_WEIGHT:F = 1.0f

.field public static final DEFAULT_HISTORY_FILE_NAME:Ljava/lang/String; = "activity_choser_model_history.xml"

.field public static final DEFAULT_HISTORY_MAX_LENGTH:I = 0x32

.field private static final HISTORY_FILE_EXTENSION:Ljava/lang/String; = ".xml"

.field private static final INVALID_INDEX:I = -0x1

.field static final LOG_TAG:Ljava/lang/String; = "ActivityChooserModel"

.field static final TAG_HISTORICAL_RECORD:Ljava/lang/String; = "historical-record"

.field static final TAG_HISTORICAL_RECORDS:Ljava/lang/String; = "historical-records"

.field private static final sDataModelRegistry:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Landroid/support/v7/widget/ActivityChooserModel;",
            ">;"
        }
    .end annotation
.end field

.field private static final sRegistryLock:Ljava/lang/Object;


# instance fields
.field private final mActivities:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/support/v7/widget/ActivityChooserModel$ActivityResolveInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mActivityChoserModelPolicy:Landroid/support/v7/widget/ActivityChooserModel$OnChooseActivityListener;

.field private mActivitySorter:Landroid/support/v7/widget/ActivityChooserModel$ActivitySorter;

.field mCanReadHistoricalData:Z

.field final mContext:Landroid/content/Context;

.field private final mHistoricalRecords:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/support/v7/widget/ActivityChooserModel$HistoricalRecord;",
            ">;"
        }
    .end annotation
.end field

.field private mHistoricalRecordsChanged:Z

.field final mHistoryFileName:Ljava/lang/String;

.field private mHistoryMaxSize:I

.field private final mInstanceLock:Ljava/lang/Object;

.field private mIntent:Landroid/content/Intent;

.field private mReadShareHistoryCalled:Z

.field private mReloadActivities:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Landroid/support/v7/widget/ActivityChooserModel;->sRegistryLock:Ljava/lang/Object;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Landroid/support/v7/widget/ActivityChooserModel;->sDataModelRegistry:Ljava/util/Map;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .registers 5

    invoke-direct {p0}, Landroid/database/DataSetObservable;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/ActivityChooserModel;->mInstanceLock:Ljava/lang/Object;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/ActivityChooserModel;->mActivities:Ljava/util/List;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/ActivityChooserModel;->mHistoricalRecords:Ljava/util/List;

    new-instance v0, Landroid/support/v7/widget/ActivityChooserModel$DefaultSorter;

    invoke-direct {v0}, Landroid/support/v7/widget/ActivityChooserModel$DefaultSorter;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/ActivityChooserModel;->mActivitySorter:Landroid/support/v7/widget/ActivityChooserModel$ActivitySorter;

    const/16 v0, 0x32

    iput v0, p0, Landroid/support/v7/widget/ActivityChooserModel;->mHistoryMaxSize:I

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v7/widget/ActivityChooserModel;->mCanReadHistoricalData:Z

    const/4 v1, 0x0

    iput-boolean v1, p0, Landroid/support/v7/widget/ActivityChooserModel;->mReadShareHistoryCalled:Z

    iput-boolean v0, p0, Landroid/support/v7/widget/ActivityChooserModel;->mHistoricalRecordsChanged:Z

    iput-boolean v1, p0, Landroid/support/v7/widget/ActivityChooserModel;->mReloadActivities:Z

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Landroid/support/v7/widget/ActivityChooserModel;->mContext:Landroid/content/Context;

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_55

    const-string p1, ".xml"

    invoke-virtual {p2, p1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_55

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, ".xml"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Landroid/support/v7/widget/ActivityChooserModel;->mHistoryFileName:Ljava/lang/String;

    goto :goto_57

    :cond_55
    iput-object p2, p0, Landroid/support/v7/widget/ActivityChooserModel;->mHistoryFileName:Ljava/lang/String;

    :goto_57
    return-void
.end method

.method private addHistoricalRecord(Landroid/support/v7/widget/ActivityChooserModel$HistoricalRecord;)Z
    .registers 3

    iget-object v0, p0, Landroid/support/v7/widget/ActivityChooserModel;->mHistoricalRecords:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_17

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v7/widget/ActivityChooserModel;->mHistoricalRecordsChanged:Z

    invoke-direct {p0}, Landroid/support/v7/widget/ActivityChooserModel;->pruneExcessiveHistoricalRecordsIfNeeded()V

    invoke-direct {p0}, Landroid/support/v7/widget/ActivityChooserModel;->persistHistoricalDataIfNeeded()V

    invoke-direct {p0}, Landroid/support/v7/widget/ActivityChooserModel;->sortActivitiesIfNeeded()Z

    invoke-virtual {p0}, Landroid/support/v7/widget/ActivityChooserModel;->notifyChanged()V

    :cond_17
    return p1
.end method

.method private ensureConsistentState()V
    .registers 3

    invoke-direct {p0}, Landroid/support/v7/widget/ActivityChooserModel;->loadActivitiesIfNeeded()Z

    move-result v0

    invoke-direct {p0}, Landroid/support/v7/widget/ActivityChooserModel;->readHistoricalDataIfNeeded()Z

    move-result v1

    or-int/2addr v0, v1

    invoke-direct {p0}, Landroid/support/v7/widget/ActivityChooserModel;->pruneExcessiveHistoricalRecordsIfNeeded()V

    if-eqz v0, :cond_14

    invoke-direct {p0}, Landroid/support/v7/widget/ActivityChooserModel;->sortActivitiesIfNeeded()Z

    invoke-virtual {p0}, Landroid/support/v7/widget/ActivityChooserModel;->notifyChanged()V

    :cond_14
    return-void
.end method

.method public static get(Landroid/content/Context;Ljava/lang/String;)Landroid/support/v7/widget/ActivityChooserModel;
    .registers 4

    sget-object v0, Landroid/support/v7/widget/ActivityChooserModel;->sRegistryLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    sget-object v1, Landroid/support/v7/widget/ActivityChooserModel;->sDataModelRegistry:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/v7/widget/ActivityChooserModel;

    if-nez v1, :cond_17

    new-instance v1, Landroid/support/v7/widget/ActivityChooserModel;

    invoke-direct {v1, p0, p1}, Landroid/support/v7/widget/ActivityChooserModel;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    sget-object p0, Landroid/support/v7/widget/ActivityChooserModel;->sDataModelRegistry:Ljava/util/Map;

    invoke-interface {p0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_17
    monitor-exit v0

    return-object v1

    :catchall_19
    move-exception p0

    monitor-exit v0
    :try_end_1b
    .catchall {:try_start_3 .. :try_end_1b} :catchall_19

    throw p0
.end method

.method private loadActivitiesIfNeeded()Z
    .registers 7

    iget-boolean v0, p0, Landroid/support/v7/widget/ActivityChooserModel;->mReloadActivities:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_37

    iget-object v0, p0, Landroid/support/v7/widget/ActivityChooserModel;->mIntent:Landroid/content/Intent;

    if-eqz v0, :cond_37

    iput-boolean v1, p0, Landroid/support/v7/widget/ActivityChooserModel;->mReloadActivities:Z

    iget-object v0, p0, Landroid/support/v7/widget/ActivityChooserModel;->mActivities:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    iget-object v0, p0, Landroid/support/v7/widget/ActivityChooserModel;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    iget-object v2, p0, Landroid/support/v7/widget/ActivityChooserModel;->mIntent:Landroid/content/Intent;

    invoke-virtual {v0, v2, v1}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    :goto_20
    if-ge v1, v2, :cond_35

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/pm/ResolveInfo;

    iget-object v4, p0, Landroid/support/v7/widget/ActivityChooserModel;->mActivities:Ljava/util/List;

    new-instance v5, Landroid/support/v7/widget/ActivityChooserModel$ActivityResolveInfo;

    invoke-direct {v5, v3}, Landroid/support/v7/widget/ActivityChooserModel$ActivityResolveInfo;-><init>(Landroid/content/pm/ResolveInfo;)V

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_20

    :cond_35
    const/4 v0, 0x1

    return v0

    :cond_37
    return v1
.end method

.method private persistHistoricalDataIfNeeded()V
    .registers 7

    iget-boolean v0, p0, Landroid/support/v7/widget/ActivityChooserModel;->mReadShareHistoryCalled:Z

    if-eqz v0, :cond_30

    iget-boolean v0, p0, Landroid/support/v7/widget/ActivityChooserModel;->mHistoricalRecordsChanged:Z

    if-nez v0, :cond_9

    return-void

    :cond_9
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v7/widget/ActivityChooserModel;->mHistoricalRecordsChanged:Z

    iget-object v1, p0, Landroid/support/v7/widget/ActivityChooserModel;->mHistoryFileName:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2f

    new-instance v1, Landroid/support/v7/widget/ActivityChooserModel$PersistHistoryAsyncTask;

    invoke-direct {v1, p0}, Landroid/support/v7/widget/ActivityChooserModel$PersistHistoryAsyncTask;-><init>(Landroid/support/v7/widget/ActivityChooserModel;)V

    sget-object v2, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    new-instance v4, Ljava/util/ArrayList;

    iget-object v5, p0, Landroid/support/v7/widget/ActivityChooserModel;->mHistoricalRecords:Ljava/util/List;

    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    aput-object v4, v3, v0

    const/4 v0, 0x1

    iget-object v4, p0, Landroid/support/v7/widget/ActivityChooserModel;->mHistoryFileName:Ljava/lang/String;

    aput-object v4, v3, v0

    invoke-virtual {v1, v2, v3}, Landroid/support/v7/widget/ActivityChooserModel$PersistHistoryAsyncTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    :cond_2f
    return-void

    :cond_30
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "No preceding call to #readHistoricalData"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private pruneExcessiveHistoricalRecordsIfNeeded()V
    .registers 5

    iget-object v0, p0, Landroid/support/v7/widget/ActivityChooserModel;->mHistoricalRecords:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    iget v1, p0, Landroid/support/v7/widget/ActivityChooserModel;->mHistoryMaxSize:I

    sub-int/2addr v0, v1

    if-gtz v0, :cond_c

    return-void

    :cond_c
    const/4 v1, 0x1

    iput-boolean v1, p0, Landroid/support/v7/widget/ActivityChooserModel;->mHistoricalRecordsChanged:Z

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_11
    if-ge v2, v0, :cond_1e

    iget-object v3, p0, Landroid/support/v7/widget/ActivityChooserModel;->mHistoricalRecords:Ljava/util/List;

    invoke-interface {v3, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/support/v7/widget/ActivityChooserModel$HistoricalRecord;

    add-int/lit8 v2, v2, 0x1

    goto :goto_11

    :cond_1e
    return-void
.end method

.method private readHistoricalDataIfNeeded()Z
    .registers 3

    iget-boolean v0, p0, Landroid/support/v7/widget/ActivityChooserModel;->mCanReadHistoricalData:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_1a

    iget-boolean v0, p0, Landroid/support/v7/widget/ActivityChooserModel;->mHistoricalRecordsChanged:Z

    if-eqz v0, :cond_1a

    iget-object v0, p0, Landroid/support/v7/widget/ActivityChooserModel;->mHistoryFileName:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1a

    iput-boolean v1, p0, Landroid/support/v7/widget/ActivityChooserModel;->mCanReadHistoricalData:Z

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v7/widget/ActivityChooserModel;->mReadShareHistoryCalled:Z

    invoke-direct {p0}, Landroid/support/v7/widget/ActivityChooserModel;->readHistoricalDataImpl()V

    return v0

    :cond_1a
    return v1
.end method

.method private readHistoricalDataImpl()V
    .registers 10

    :try_start_0
    iget-object v0, p0, Landroid/support/v7/widget/ActivityChooserModel;->mContext:Landroid/content/Context;

    iget-object v1, p0, Landroid/support/v7/widget/ActivityChooserModel;->mHistoryFileName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/content/Context;->openFileInput(Ljava/lang/String;)Ljava/io/FileInputStream;

    move-result-object v0
    :try_end_8
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_8} :catch_c4

    :try_start_8
    invoke-static {}, Landroid/util/Xml;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v1

    const-string v2, "UTF-8"

    invoke-interface {v1, v0, v2}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/InputStream;Ljava/lang/String;)V

    const/4 v2, 0x0

    :goto_12
    const/4 v3, 0x1

    if-eq v2, v3, :cond_1d

    const/4 v4, 0x2

    if-eq v2, v4, :cond_1d

    invoke-interface {v1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v2

    goto :goto_12

    :cond_1d
    const-string v2, "historical-records"

    invoke-interface {v1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7a

    iget-object v2, p0, Landroid/support/v7/widget/ActivityChooserModel;->mHistoricalRecords:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->clear()V

    :cond_2e
    :goto_2e
    invoke-interface {v1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v4
    :try_end_32
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_8 .. :try_end_32} :catch_a0
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_32} :catch_84
    .catchall {:try_start_8 .. :try_end_32} :catchall_82

    if-ne v4, v3, :cond_3b

    if-eqz v0, :cond_bd

    :goto_36
    :try_start_36
    invoke-virtual {v0}, Ljava/io/FileInputStream;->close()V
    :try_end_39
    .catch Ljava/io/IOException; {:try_start_36 .. :try_end_39} :catch_bd

    goto/16 :goto_bd

    :cond_3b
    const/4 v5, 0x3

    if-eq v4, v5, :cond_2e

    const/4 v5, 0x4

    if-ne v4, v5, :cond_42

    goto :goto_2e

    :cond_42
    :try_start_42
    invoke-interface {v1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v4

    const-string v5, "historical-record"

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_72

    const-string v4, "activity"

    const/4 v5, 0x0

    invoke-interface {v1, v5, v4}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v6, "time"

    invoke-interface {v1, v5, v6}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v6

    const-string v8, "weight"

    invoke-interface {v1, v5, v8}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v5

    new-instance v8, Landroid/support/v7/widget/ActivityChooserModel$HistoricalRecord;

    invoke-direct {v8, v4, v6, v7, v5}, Landroid/support/v7/widget/ActivityChooserModel$HistoricalRecord;-><init>(Ljava/lang/String;JF)V

    invoke-interface {v2, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2e

    :cond_72
    new-instance v1, Lorg/xmlpull/v1/XmlPullParserException;

    const-string v2, "Share records file not well-formed."

    invoke-direct {v1, v2}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_7a
    new-instance v1, Lorg/xmlpull/v1/XmlPullParserException;

    const-string v2, "Share records file does not start with historical-records tag."

    invoke-direct {v1, v2}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_82
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_42 .. :try_end_82} :catch_a0
    .catch Ljava/io/IOException; {:try_start_42 .. :try_end_82} :catch_84
    .catchall {:try_start_42 .. :try_end_82} :catchall_82

    :catchall_82
    move-exception v1

    goto :goto_be

    :catch_84
    move-exception v1

    :try_start_85
    sget-object v2, Landroid/support/v7/widget/ActivityChooserModel;->LOG_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Error reading historical recrod file: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Landroid/support/v7/widget/ActivityChooserModel;->mHistoryFileName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    if-eqz v0, :cond_bd

    goto :goto_36

    :catch_a0
    move-exception v1

    sget-object v2, Landroid/support/v7/widget/ActivityChooserModel;->LOG_TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Error reading historical recrod file: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Landroid/support/v7/widget/ActivityChooserModel;->mHistoryFileName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_b9
    .catchall {:try_start_85 .. :try_end_b9} :catchall_82

    if-eqz v0, :cond_bd

    goto/16 :goto_36

    :catch_bd
    :cond_bd
    :goto_bd
    return-void

    :goto_be
    if-eqz v0, :cond_c3

    :try_start_c0
    invoke-virtual {v0}, Ljava/io/FileInputStream;->close()V
    :try_end_c3
    .catch Ljava/io/IOException; {:try_start_c0 .. :try_end_c3} :catch_c3

    :catch_c3
    :cond_c3
    throw v1

    :catch_c4
    return-void
.end method

.method private sortActivitiesIfNeeded()Z
    .registers 5

    iget-object v0, p0, Landroid/support/v7/widget/ActivityChooserModel;->mActivitySorter:Landroid/support/v7/widget/ActivityChooserModel$ActivitySorter;

    if-eqz v0, :cond_29

    iget-object v0, p0, Landroid/support/v7/widget/ActivityChooserModel;->mIntent:Landroid/content/Intent;

    if-eqz v0, :cond_29

    iget-object v0, p0, Landroid/support/v7/widget/ActivityChooserModel;->mActivities:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_29

    iget-object v0, p0, Landroid/support/v7/widget/ActivityChooserModel;->mHistoricalRecords:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_29

    iget-object v0, p0, Landroid/support/v7/widget/ActivityChooserModel;->mActivitySorter:Landroid/support/v7/widget/ActivityChooserModel$ActivitySorter;

    iget-object v1, p0, Landroid/support/v7/widget/ActivityChooserModel;->mIntent:Landroid/content/Intent;

    iget-object v2, p0, Landroid/support/v7/widget/ActivityChooserModel;->mActivities:Ljava/util/List;

    iget-object v3, p0, Landroid/support/v7/widget/ActivityChooserModel;->mHistoricalRecords:Ljava/util/List;

    invoke-static {v3}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v0, v1, v2, v3}, Landroid/support/v7/widget/ActivityChooserModel$ActivitySorter;->sort(Landroid/content/Intent;Ljava/util/List;Ljava/util/List;)V

    const/4 v0, 0x1

    return v0

    :cond_29
    const/4 v0, 0x0

    return v0
.end method


# virtual methods
.method public chooseActivity(I)Landroid/content/Intent;
    .registers 8

    iget-object v0, p0, Landroid/support/v7/widget/ActivityChooserModel;->mInstanceLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget-object v1, p0, Landroid/support/v7/widget/ActivityChooserModel;->mIntent:Landroid/content/Intent;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    monitor-exit v0

    return-object v2

    :cond_a
    invoke-direct {p0}, Landroid/support/v7/widget/ActivityChooserModel;->ensureConsistentState()V

    iget-object v1, p0, Landroid/support/v7/widget/ActivityChooserModel;->mActivities:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/support/v7/widget/ActivityChooserModel$ActivityResolveInfo;

    new-instance v1, Landroid/content/ComponentName;

    iget-object v3, p1, Landroid/support/v7/widget/ActivityChooserModel$ActivityResolveInfo;->resolveInfo:Landroid/content/pm/ResolveInfo;

    iget-object v3, v3, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v3, v3, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    iget-object p1, p1, Landroid/support/v7/widget/ActivityChooserModel$ActivityResolveInfo;->resolveInfo:Landroid/content/pm/ResolveInfo;

    iget-object p1, p1, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object p1, p1, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    invoke-direct {v1, v3, p1}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    new-instance p1, Landroid/content/Intent;

    iget-object v3, p0, Landroid/support/v7/widget/ActivityChooserModel;->mIntent:Landroid/content/Intent;

    invoke-direct {p1, v3}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    invoke-virtual {p1, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    iget-object v3, p0, Landroid/support/v7/widget/ActivityChooserModel;->mActivityChoserModelPolicy:Landroid/support/v7/widget/ActivityChooserModel$OnChooseActivityListener;

    if-eqz v3, :cond_43

    new-instance v3, Landroid/content/Intent;

    invoke-direct {v3, p1}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    iget-object v4, p0, Landroid/support/v7/widget/ActivityChooserModel;->mActivityChoserModelPolicy:Landroid/support/v7/widget/ActivityChooserModel$OnChooseActivityListener;

    invoke-interface {v4, p0, v3}, Landroid/support/v7/widget/ActivityChooserModel$OnChooseActivityListener;->onChooseActivity(Landroid/support/v7/widget/ActivityChooserModel;Landroid/content/Intent;)Z

    move-result v3

    if-eqz v3, :cond_43

    monitor-exit v0

    return-object v2

    :cond_43
    new-instance v2, Landroid/support/v7/widget/ActivityChooserModel$HistoricalRecord;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    const/high16 v5, 0x3f800000    # 1.0f

    invoke-direct {v2, v1, v3, v4, v5}, Landroid/support/v7/widget/ActivityChooserModel$HistoricalRecord;-><init>(Landroid/content/ComponentName;JF)V

    invoke-direct {p0, v2}, Landroid/support/v7/widget/ActivityChooserModel;->addHistoricalRecord(Landroid/support/v7/widget/ActivityChooserModel$HistoricalRecord;)Z

    monitor-exit v0

    return-object p1

    :catchall_53
    move-exception p1

    monitor-exit v0
    :try_end_55
    .catchall {:try_start_3 .. :try_end_55} :catchall_53

    throw p1
.end method

.method public getActivity(I)Landroid/content/pm/ResolveInfo;
    .registers 4

    iget-object v0, p0, Landroid/support/v7/widget/ActivityChooserModel;->mInstanceLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    invoke-direct {p0}, Landroid/support/v7/widget/ActivityChooserModel;->ensureConsistentState()V

    iget-object v1, p0, Landroid/support/v7/widget/ActivityChooserModel;->mActivities:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/support/v7/widget/ActivityChooserModel$ActivityResolveInfo;

    iget-object p1, p1, Landroid/support/v7/widget/ActivityChooserModel$ActivityResolveInfo;->resolveInfo:Landroid/content/pm/ResolveInfo;

    monitor-exit v0

    return-object p1

    :catchall_12
    move-exception p1

    monitor-exit v0
    :try_end_14
    .catchall {:try_start_3 .. :try_end_14} :catchall_12

    throw p1
.end method

.method public getActivityCount()I
    .registers 3

    iget-object v0, p0, Landroid/support/v7/widget/ActivityChooserModel;->mInstanceLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    invoke-direct {p0}, Landroid/support/v7/widget/ActivityChooserModel;->ensureConsistentState()V

    iget-object v1, p0, Landroid/support/v7/widget/ActivityChooserModel;->mActivities:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    monitor-exit v0

    return v1

    :catchall_e
    move-exception v1

    monitor-exit v0
    :try_end_10
    .catchall {:try_start_3 .. :try_end_10} :catchall_e

    throw v1
.end method

.method public getActivityIndex(Landroid/content/pm/ResolveInfo;)I
    .registers 7

    iget-object v0, p0, Landroid/support/v7/widget/ActivityChooserModel;->mInstanceLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    invoke-direct {p0}, Landroid/support/v7/widget/ActivityChooserModel;->ensureConsistentState()V

    iget-object v1, p0, Landroid/support/v7/widget/ActivityChooserModel;->mActivities:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    const/4 v3, 0x0

    :goto_d
    if-ge v3, v2, :cond_1e

    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/support/v7/widget/ActivityChooserModel$ActivityResolveInfo;

    iget-object v4, v4, Landroid/support/v7/widget/ActivityChooserModel$ActivityResolveInfo;->resolveInfo:Landroid/content/pm/ResolveInfo;

    if-ne v4, p1, :cond_1b

    monitor-exit v0

    return v3

    :cond_1b
    add-int/lit8 v3, v3, 0x1

    goto :goto_d

    :cond_1e
    const/4 p1, -0x1

    monitor-exit v0

    return p1

    :catchall_21
    move-exception p1

    monitor-exit v0
    :try_end_23
    .catchall {:try_start_3 .. :try_end_23} :catchall_21

    throw p1
.end method

.method public getDefaultActivity()Landroid/content/pm/ResolveInfo;
    .registers 4

    iget-object v0, p0, Landroid/support/v7/widget/ActivityChooserModel;->mInstanceLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    invoke-direct {p0}, Landroid/support/v7/widget/ActivityChooserModel;->ensureConsistentState()V

    iget-object v1, p0, Landroid/support/v7/widget/ActivityChooserModel;->mActivities:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1b

    iget-object v1, p0, Landroid/support/v7/widget/ActivityChooserModel;->mActivities:Ljava/util/List;

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/v7/widget/ActivityChooserModel$ActivityResolveInfo;

    iget-object v1, v1, Landroid/support/v7/widget/ActivityChooserModel$ActivityResolveInfo;->resolveInfo:Landroid/content/pm/ResolveInfo;

    monitor-exit v0

    return-object v1

    :cond_1b
    monitor-exit v0

    const/4 v0, 0x0

    return-object v0

    :catchall_1e
    move-exception v1

    monitor-exit v0
    :try_end_20
    .catchall {:try_start_3 .. :try_end_20} :catchall_1e

    throw v1
.end method

.method public getHistoryMaxSize()I
    .registers 3

    iget-object v0, p0, Landroid/support/v7/widget/ActivityChooserModel;->mInstanceLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget v1, p0, Landroid/support/v7/widget/ActivityChooserModel;->mHistoryMaxSize:I

    monitor-exit v0

    return v1

    :catchall_7
    move-exception v1

    monitor-exit v0
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_7

    throw v1
.end method

.method public getHistorySize()I
    .registers 3

    iget-object v0, p0, Landroid/support/v7/widget/ActivityChooserModel;->mInstanceLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    invoke-direct {p0}, Landroid/support/v7/widget/ActivityChooserModel;->ensureConsistentState()V

    iget-object v1, p0, Landroid/support/v7/widget/ActivityChooserModel;->mHistoricalRecords:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    monitor-exit v0

    return v1

    :catchall_e
    move-exception v1

    monitor-exit v0
    :try_end_10
    .catchall {:try_start_3 .. :try_end_10} :catchall_e

    throw v1
.end method

.method public getIntent()Landroid/content/Intent;
    .registers 3

    iget-object v0, p0, Landroid/support/v7/widget/ActivityChooserModel;->mInstanceLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget-object v1, p0, Landroid/support/v7/widget/ActivityChooserModel;->mIntent:Landroid/content/Intent;

    monitor-exit v0

    return-object v1

    :catchall_7
    move-exception v1

    monitor-exit v0
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_7

    throw v1
.end method

.method public setActivitySorter(Landroid/support/v7/widget/ActivityChooserModel$ActivitySorter;)V
    .registers 4

    iget-object v0, p0, Landroid/support/v7/widget/ActivityChooserModel;->mInstanceLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget-object v1, p0, Landroid/support/v7/widget/ActivityChooserModel;->mActivitySorter:Landroid/support/v7/widget/ActivityChooserModel$ActivitySorter;

    if-ne v1, p1, :cond_9

    monitor-exit v0

    return-void

    :cond_9
    iput-object p1, p0, Landroid/support/v7/widget/ActivityChooserModel;->mActivitySorter:Landroid/support/v7/widget/ActivityChooserModel$ActivitySorter;

    invoke-direct {p0}, Landroid/support/v7/widget/ActivityChooserModel;->sortActivitiesIfNeeded()Z

    move-result p1

    if-eqz p1, :cond_14

    invoke-virtual {p0}, Landroid/support/v7/widget/ActivityChooserModel;->notifyChanged()V

    :cond_14
    monitor-exit v0

    return-void

    :catchall_16
    move-exception p1

    monitor-exit v0
    :try_end_18
    .catchall {:try_start_3 .. :try_end_18} :catchall_16

    throw p1
.end method

.method public setDefaultActivity(I)V
    .registers 7

    iget-object v0, p0, Landroid/support/v7/widget/ActivityChooserModel;->mInstanceLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    invoke-direct {p0}, Landroid/support/v7/widget/ActivityChooserModel;->ensureConsistentState()V

    iget-object v1, p0, Landroid/support/v7/widget/ActivityChooserModel;->mActivities:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/support/v7/widget/ActivityChooserModel$ActivityResolveInfo;

    iget-object v1, p0, Landroid/support/v7/widget/ActivityChooserModel;->mActivities:Ljava/util/List;

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/v7/widget/ActivityChooserModel$ActivityResolveInfo;

    if-eqz v1, :cond_22

    iget v1, v1, Landroid/support/v7/widget/ActivityChooserModel$ActivityResolveInfo;->weight:F

    iget v2, p1, Landroid/support/v7/widget/ActivityChooserModel$ActivityResolveInfo;->weight:F

    sub-float/2addr v1, v2

    const/high16 v2, 0x40a00000    # 5.0f

    add-float/2addr v1, v2

    goto :goto_24

    :cond_22
    const/high16 v1, 0x3f800000    # 1.0f

    :goto_24
    new-instance v2, Landroid/content/ComponentName;

    iget-object v3, p1, Landroid/support/v7/widget/ActivityChooserModel$ActivityResolveInfo;->resolveInfo:Landroid/content/pm/ResolveInfo;

    iget-object v3, v3, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object v3, v3, Landroid/content/pm/ActivityInfo;->packageName:Ljava/lang/String;

    iget-object p1, p1, Landroid/support/v7/widget/ActivityChooserModel$ActivityResolveInfo;->resolveInfo:Landroid/content/pm/ResolveInfo;

    iget-object p1, p1, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    iget-object p1, p1, Landroid/content/pm/ActivityInfo;->name:Ljava/lang/String;

    invoke-direct {v2, v3, p1}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    new-instance p1, Landroid/support/v7/widget/ActivityChooserModel$HistoricalRecord;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-direct {p1, v2, v3, v4, v1}, Landroid/support/v7/widget/ActivityChooserModel$HistoricalRecord;-><init>(Landroid/content/ComponentName;JF)V

    invoke-direct {p0, p1}, Landroid/support/v7/widget/ActivityChooserModel;->addHistoricalRecord(Landroid/support/v7/widget/ActivityChooserModel$HistoricalRecord;)Z

    monitor-exit v0

    return-void

    :catchall_43
    move-exception p1

    monitor-exit v0
    :try_end_45
    .catchall {:try_start_3 .. :try_end_45} :catchall_43

    throw p1
.end method

.method public setHistoryMaxSize(I)V
    .registers 4

    iget-object v0, p0, Landroid/support/v7/widget/ActivityChooserModel;->mInstanceLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget v1, p0, Landroid/support/v7/widget/ActivityChooserModel;->mHistoryMaxSize:I

    if-ne v1, p1, :cond_9

    monitor-exit v0

    return-void

    :cond_9
    iput p1, p0, Landroid/support/v7/widget/ActivityChooserModel;->mHistoryMaxSize:I

    invoke-direct {p0}, Landroid/support/v7/widget/ActivityChooserModel;->pruneExcessiveHistoricalRecordsIfNeeded()V

    invoke-direct {p0}, Landroid/support/v7/widget/ActivityChooserModel;->sortActivitiesIfNeeded()Z

    move-result p1

    if-eqz p1, :cond_17

    invoke-virtual {p0}, Landroid/support/v7/widget/ActivityChooserModel;->notifyChanged()V

    :cond_17
    monitor-exit v0

    return-void

    :catchall_19
    move-exception p1

    monitor-exit v0
    :try_end_1b
    .catchall {:try_start_3 .. :try_end_1b} :catchall_19

    throw p1
.end method

.method public setIntent(Landroid/content/Intent;)V
    .registers 4

    iget-object v0, p0, Landroid/support/v7/widget/ActivityChooserModel;->mInstanceLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget-object v1, p0, Landroid/support/v7/widget/ActivityChooserModel;->mIntent:Landroid/content/Intent;

    if-ne v1, p1, :cond_9

    monitor-exit v0

    return-void

    :cond_9
    iput-object p1, p0, Landroid/support/v7/widget/ActivityChooserModel;->mIntent:Landroid/content/Intent;

    const/4 p1, 0x1

    iput-boolean p1, p0, Landroid/support/v7/widget/ActivityChooserModel;->mReloadActivities:Z

    invoke-direct {p0}, Landroid/support/v7/widget/ActivityChooserModel;->ensureConsistentState()V

    monitor-exit v0

    return-void

    :catchall_13
    move-exception p1

    monitor-exit v0
    :try_end_15
    .catchall {:try_start_3 .. :try_end_15} :catchall_13

    throw p1
.end method

.method public setOnChooseActivityListener(Landroid/support/v7/widget/ActivityChooserModel$OnChooseActivityListener;)V
    .registers 3

    iget-object v0, p0, Landroid/support/v7/widget/ActivityChooserModel;->mInstanceLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iput-object p1, p0, Landroid/support/v7/widget/ActivityChooserModel;->mActivityChoserModelPolicy:Landroid/support/v7/widget/ActivityChooserModel$OnChooseActivityListener;

    monitor-exit v0

    return-void

    :catchall_7
    move-exception p1

    monitor-exit v0
    :try_end_9
    .catchall {:try_start_3 .. :try_end_9} :catchall_7

    throw p1
.end method
