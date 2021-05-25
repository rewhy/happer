.class public final Landroid/support/v4/app/NotificationCompat$MessagingStyle$Message;
.super Ljava/lang/Object;
.source "NotificationCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/app/NotificationCompat$MessagingStyle;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Message"
.end annotation


# static fields
.field static final KEY_DATA_MIME_TYPE:Ljava/lang/String; = "type"

.field static final KEY_DATA_URI:Ljava/lang/String; = "uri"

.field static final KEY_EXTRAS_BUNDLE:Ljava/lang/String; = "extras"

.field static final KEY_NOTIFICATION_PERSON:Ljava/lang/String; = "sender_person"

.field static final KEY_PERSON:Ljava/lang/String; = "person"

.field static final KEY_SENDER:Ljava/lang/String; = "sender"

.field static final KEY_TEXT:Ljava/lang/String; = "text"

.field static final KEY_TIMESTAMP:Ljava/lang/String; = "time"


# instance fields
.field private mDataMimeType:Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private mDataUri:Landroid/net/Uri;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private mExtras:Landroid/os/Bundle;

.field private final mPerson:Landroid/support/v4/app/Person;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private final mText:Ljava/lang/CharSequence;

.field private final mTimestamp:J


# direct methods
.method public constructor <init>(Ljava/lang/CharSequence;JLandroid/support/v4/app/Person;)V
    .registers 6
    .param p4    # Landroid/support/v4/app/Person;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    iput-object v0, p0, Landroid/support/v4/app/NotificationCompat$MessagingStyle$Message;->mExtras:Landroid/os/Bundle;

    iput-object p1, p0, Landroid/support/v4/app/NotificationCompat$MessagingStyle$Message;->mText:Ljava/lang/CharSequence;

    iput-wide p2, p0, Landroid/support/v4/app/NotificationCompat$MessagingStyle$Message;->mTimestamp:J

    iput-object p4, p0, Landroid/support/v4/app/NotificationCompat$MessagingStyle$Message;->mPerson:Landroid/support/v4/app/Person;

    return-void
.end method

.method public constructor <init>(Ljava/lang/CharSequence;JLjava/lang/CharSequence;)V
    .registers 6
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    new-instance v0, Landroid/support/v4/app/Person$Builder;

    invoke-direct {v0}, Landroid/support/v4/app/Person$Builder;-><init>()V

    invoke-virtual {v0, p4}, Landroid/support/v4/app/Person$Builder;->setName(Ljava/lang/CharSequence;)Landroid/support/v4/app/Person$Builder;

    move-result-object p4

    invoke-virtual {p4}, Landroid/support/v4/app/Person$Builder;->build()Landroid/support/v4/app/Person;

    move-result-object p4

    invoke-direct {p0, p1, p2, p3, p4}, Landroid/support/v4/app/NotificationCompat$MessagingStyle$Message;-><init>(Ljava/lang/CharSequence;JLandroid/support/v4/app/Person;)V

    return-void
.end method

.method static getBundleArrayForMessages(Ljava/util/List;)[Landroid/os/Bundle;
    .registers 5
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/support/v4/app/NotificationCompat$MessagingStyle$Message;",
            ">;)[",
            "Landroid/os/Bundle;"
        }
    .end annotation

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    new-array v0, v0, [Landroid/os/Bundle;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x0

    :goto_b
    if-ge v2, v1, :cond_1c

    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/support/v4/app/NotificationCompat$MessagingStyle$Message;

    invoke-direct {v3}, Landroid/support/v4/app/NotificationCompat$MessagingStyle$Message;->toBundle()Landroid/os/Bundle;

    move-result-object v3

    aput-object v3, v0, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_b

    :cond_1c
    return-object v0
.end method

.method static getMessageFromBundle(Landroid/os/Bundle;)Landroid/support/v4/app/NotificationCompat$MessagingStyle$Message;
    .registers 7
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    const/4 v0, 0x0

    :try_start_1
    const-string v1, "text"

    invoke-virtual {p0, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_a6

    const-string v1, "time"

    invoke-virtual {p0, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_13

    goto/16 :goto_a6

    :cond_13
    const-string v1, "person"

    invoke-virtual {p0, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_26

    const-string v1, "person"

    invoke-virtual {p0, v1}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v1

    invoke-static {v1}, Landroid/support/v4/app/Person;->fromBundle(Landroid/os/Bundle;)Landroid/support/v4/app/Person;

    move-result-object v1

    goto :goto_5e

    :cond_26
    const-string v1, "sender_person"

    invoke-virtual {p0, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_41

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1c

    if-lt v1, v2, :cond_41

    const-string v1, "sender_person"

    invoke-virtual {p0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Landroid/app/Person;

    invoke-static {v1}, Landroid/support/v4/app/Person;->fromAndroidPerson(Landroid/app/Person;)Landroid/support/v4/app/Person;

    move-result-object v1

    goto :goto_5e

    :cond_41
    const-string v1, "sender"

    invoke-virtual {p0, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5d

    new-instance v1, Landroid/support/v4/app/Person$Builder;

    invoke-direct {v1}, Landroid/support/v4/app/Person$Builder;-><init>()V

    const-string v2, "sender"

    invoke-virtual {p0, v2}, Landroid/os/Bundle;->getCharSequence(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/support/v4/app/Person$Builder;->setName(Ljava/lang/CharSequence;)Landroid/support/v4/app/Person$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v4/app/Person$Builder;->build()Landroid/support/v4/app/Person;

    move-result-object v1

    goto :goto_5e

    :cond_5d
    move-object v1, v0

    :goto_5e
    new-instance v2, Landroid/support/v4/app/NotificationCompat$MessagingStyle$Message;

    const-string v3, "text"

    invoke-virtual {p0, v3}, Landroid/os/Bundle;->getCharSequence(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v3

    const-string v4, "time"

    invoke-virtual {p0, v4}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v4

    invoke-direct {v2, v3, v4, v5, v1}, Landroid/support/v4/app/NotificationCompat$MessagingStyle$Message;-><init>(Ljava/lang/CharSequence;JLandroid/support/v4/app/Person;)V

    const-string v1, "type"

    invoke-virtual {p0, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_90

    const-string v1, "uri"

    invoke-virtual {p0, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_90

    const-string v1, "type"

    invoke-virtual {p0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v3, "uri"

    invoke-virtual {p0, v3}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v3

    check-cast v3, Landroid/net/Uri;

    invoke-virtual {v2, v1, v3}, Landroid/support/v4/app/NotificationCompat$MessagingStyle$Message;->setData(Ljava/lang/String;Landroid/net/Uri;)Landroid/support/v4/app/NotificationCompat$MessagingStyle$Message;

    :cond_90
    const-string v1, "extras"

    invoke-virtual {p0, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_a5

    invoke-virtual {v2}, Landroid/support/v4/app/NotificationCompat$MessagingStyle$Message;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    const-string v3, "extras"

    invoke-virtual {p0, v3}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object p0

    invoke-virtual {v1, p0}, Landroid/os/Bundle;->putAll(Landroid/os/Bundle;)V
    :try_end_a5
    .catch Ljava/lang/ClassCastException; {:try_start_1 .. :try_end_a5} :catch_a7

    :cond_a5
    return-object v2

    :cond_a6
    :goto_a6
    return-object v0

    :catch_a7
    return-object v0
.end method

.method static getMessagesFromBundleArray([Landroid/os/Parcelable;)Ljava/util/List;
    .registers 4
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Landroid/os/Parcelable;",
            ")",
            "Ljava/util/List<",
            "Landroid/support/v4/app/NotificationCompat$MessagingStyle$Message;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    array-length v1, p0

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v1, 0x0

    :goto_7
    array-length v2, p0

    if-ge v1, v2, :cond_20

    aget-object v2, p0, v1

    instance-of v2, v2, Landroid/os/Bundle;

    if-eqz v2, :cond_1d

    aget-object v2, p0, v1

    check-cast v2, Landroid/os/Bundle;

    invoke-static {v2}, Landroid/support/v4/app/NotificationCompat$MessagingStyle$Message;->getMessageFromBundle(Landroid/os/Bundle;)Landroid/support/v4/app/NotificationCompat$MessagingStyle$Message;

    move-result-object v2

    if-eqz v2, :cond_1d

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_1d
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    :cond_20
    return-object v0
.end method

.method private toBundle()Landroid/os/Bundle;
    .registers 5

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    iget-object v1, p0, Landroid/support/v4/app/NotificationCompat$MessagingStyle$Message;->mText:Ljava/lang/CharSequence;

    if-eqz v1, :cond_10

    const-string v1, "text"

    iget-object v2, p0, Landroid/support/v4/app/NotificationCompat$MessagingStyle$Message;->mText:Ljava/lang/CharSequence;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putCharSequence(Ljava/lang/String;Ljava/lang/CharSequence;)V

    :cond_10
    const-string v1, "time"

    iget-wide v2, p0, Landroid/support/v4/app/NotificationCompat$MessagingStyle$Message;->mTimestamp:J

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    iget-object v1, p0, Landroid/support/v4/app/NotificationCompat$MessagingStyle$Message;->mPerson:Landroid/support/v4/app/Person;

    if-eqz v1, :cond_43

    const-string v1, "sender"

    iget-object v2, p0, Landroid/support/v4/app/NotificationCompat$MessagingStyle$Message;->mPerson:Landroid/support/v4/app/Person;

    invoke-virtual {v2}, Landroid/support/v4/app/Person;->getName()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putCharSequence(Ljava/lang/String;Ljava/lang/CharSequence;)V

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1c

    if-lt v1, v2, :cond_38

    const-string v1, "sender_person"

    iget-object v2, p0, Landroid/support/v4/app/NotificationCompat$MessagingStyle$Message;->mPerson:Landroid/support/v4/app/Person;

    invoke-virtual {v2}, Landroid/support/v4/app/Person;->toAndroidPerson()Landroid/app/Person;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    goto :goto_43

    :cond_38
    const-string v1, "person"

    iget-object v2, p0, Landroid/support/v4/app/NotificationCompat$MessagingStyle$Message;->mPerson:Landroid/support/v4/app/Person;

    invoke-virtual {v2}, Landroid/support/v4/app/Person;->toBundle()Landroid/os/Bundle;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    :cond_43
    :goto_43
    iget-object v1, p0, Landroid/support/v4/app/NotificationCompat$MessagingStyle$Message;->mDataMimeType:Ljava/lang/String;

    if-eqz v1, :cond_4e

    const-string v1, "type"

    iget-object v2, p0, Landroid/support/v4/app/NotificationCompat$MessagingStyle$Message;->mDataMimeType:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_4e
    iget-object v1, p0, Landroid/support/v4/app/NotificationCompat$MessagingStyle$Message;->mDataUri:Landroid/net/Uri;

    if-eqz v1, :cond_59

    const-string v1, "uri"

    iget-object v2, p0, Landroid/support/v4/app/NotificationCompat$MessagingStyle$Message;->mDataUri:Landroid/net/Uri;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    :cond_59
    iget-object v1, p0, Landroid/support/v4/app/NotificationCompat$MessagingStyle$Message;->mExtras:Landroid/os/Bundle;

    if-eqz v1, :cond_64

    const-string v1, "extras"

    iget-object v2, p0, Landroid/support/v4/app/NotificationCompat$MessagingStyle$Message;->mExtras:Landroid/os/Bundle;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    :cond_64
    return-object v0
.end method


# virtual methods
.method public getDataMimeType()Ljava/lang/String;
    .registers 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Landroid/support/v4/app/NotificationCompat$MessagingStyle$Message;->mDataMimeType:Ljava/lang/String;

    return-object v0
.end method

.method public getDataUri()Landroid/net/Uri;
    .registers 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Landroid/support/v4/app/NotificationCompat$MessagingStyle$Message;->mDataUri:Landroid/net/Uri;

    return-object v0
.end method

.method public getExtras()Landroid/os/Bundle;
    .registers 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iget-object v0, p0, Landroid/support/v4/app/NotificationCompat$MessagingStyle$Message;->mExtras:Landroid/os/Bundle;

    return-object v0
.end method

.method public getPerson()Landroid/support/v4/app/Person;
    .registers 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Landroid/support/v4/app/NotificationCompat$MessagingStyle$Message;->mPerson:Landroid/support/v4/app/Person;

    return-object v0
.end method

.method public getSender()Ljava/lang/CharSequence;
    .registers 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    iget-object v0, p0, Landroid/support/v4/app/NotificationCompat$MessagingStyle$Message;->mPerson:Landroid/support/v4/app/Person;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    goto :goto_c

    :cond_6
    iget-object v0, p0, Landroid/support/v4/app/NotificationCompat$MessagingStyle$Message;->mPerson:Landroid/support/v4/app/Person;

    invoke-virtual {v0}, Landroid/support/v4/app/Person;->getName()Ljava/lang/CharSequence;

    move-result-object v0

    :goto_c
    return-object v0
.end method

.method public getText()Ljava/lang/CharSequence;
    .registers 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    iget-object v0, p0, Landroid/support/v4/app/NotificationCompat$MessagingStyle$Message;->mText:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public getTimestamp()J
    .registers 3

    iget-wide v0, p0, Landroid/support/v4/app/NotificationCompat$MessagingStyle$Message;->mTimestamp:J

    return-wide v0
.end method

.method public setData(Ljava/lang/String;Landroid/net/Uri;)Landroid/support/v4/app/NotificationCompat$MessagingStyle$Message;
    .registers 3

    iput-object p1, p0, Landroid/support/v4/app/NotificationCompat$MessagingStyle$Message;->mDataMimeType:Ljava/lang/String;

    iput-object p2, p0, Landroid/support/v4/app/NotificationCompat$MessagingStyle$Message;->mDataUri:Landroid/net/Uri;

    return-object p0
.end method
