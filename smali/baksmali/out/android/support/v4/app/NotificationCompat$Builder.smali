.class public Landroid/support/v4/app/NotificationCompat$Builder;
.super Ljava/lang/Object;
.source "NotificationCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/app/NotificationCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# static fields
.field private static final MAX_CHARSEQUENCE_LENGTH:I = 0x1400


# instance fields
.field public mActions:Ljava/util/ArrayList;
    .annotation build Landroid/support/annotation/RestrictTo;
        value = {
            .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/support/v4/app/NotificationCompat$Action;",
            ">;"
        }
    .end annotation
.end field

.field mBadgeIcon:I

.field mBigContentView:Landroid/widget/RemoteViews;

.field mCategory:Ljava/lang/String;

.field mChannelId:Ljava/lang/String;

.field mColor:I

.field mColorized:Z

.field mColorizedSet:Z

.field mContentInfo:Ljava/lang/CharSequence;

.field mContentIntent:Landroid/app/PendingIntent;

.field mContentText:Ljava/lang/CharSequence;

.field mContentTitle:Ljava/lang/CharSequence;

.field mContentView:Landroid/widget/RemoteViews;

.field public mContext:Landroid/content/Context;
    .annotation build Landroid/support/annotation/RestrictTo;
        value = {
            .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
        }
    .end annotation
.end field

.field mExtras:Landroid/os/Bundle;

.field mFullScreenIntent:Landroid/app/PendingIntent;

.field mGroupAlertBehavior:I

.field mGroupKey:Ljava/lang/String;

.field mGroupSummary:Z

.field mHeadsUpContentView:Landroid/widget/RemoteViews;

.field mInvisibleActions:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/support/v4/app/NotificationCompat$Action;",
            ">;"
        }
    .end annotation
.end field

.field mLargeIcon:Landroid/graphics/Bitmap;

.field mLocalOnly:Z

.field mNotification:Landroid/app/Notification;

.field mNumber:I

.field public mPeople:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field mPriority:I

.field mProgress:I

.field mProgressIndeterminate:Z

.field mProgressMax:I

.field mPublicVersion:Landroid/app/Notification;

.field mRemoteInputHistory:[Ljava/lang/CharSequence;

.field mShortcutId:Ljava/lang/String;

.field mShowWhen:Z

.field mSortKey:Ljava/lang/String;

.field mStyle:Landroid/support/v4/app/NotificationCompat$Style;

.field mSubText:Ljava/lang/CharSequence;

.field mTickerView:Landroid/widget/RemoteViews;

.field mTimeout:J

.field mUseChronometer:Z

.field mVisibility:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroid/support/v4/app/NotificationCompat$Builder;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .registers 6
    .param p1    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mActions:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mInvisibleActions:Ljava/util/ArrayList;

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mShowWhen:Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mLocalOnly:Z

    iput v0, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mColor:I

    iput v0, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mVisibility:I

    iput v0, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mBadgeIcon:I

    iput v0, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mGroupAlertBehavior:I

    new-instance v1, Landroid/app/Notification;

    invoke-direct {v1}, Landroid/app/Notification;-><init>()V

    iput-object v1, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mNotification:Landroid/app/Notification;

    iput-object p1, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mContext:Landroid/content/Context;

    iput-object p2, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mChannelId:Ljava/lang/String;

    iget-object p1, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mNotification:Landroid/app/Notification;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iput-wide v1, p1, Landroid/app/Notification;->when:J

    iget-object p1, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mNotification:Landroid/app/Notification;

    const/4 p2, -0x1

    iput p2, p1, Landroid/app/Notification;->audioStreamType:I

    iput v0, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mPriority:I

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mPeople:Ljava/util/ArrayList;

    return-void
.end method

.method protected static limitCharSequenceLength(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
    .registers 3

    if-nez p0, :cond_3

    return-object p0

    :cond_3
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    const/16 v1, 0x1400

    if-le v0, v1, :cond_10

    const/4 v0, 0x0

    invoke-interface {p0, v0, v1}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object p0

    :cond_10
    return-object p0
.end method

.method private reduceLargeIconSize(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .registers 11

    if-eqz p1, :cond_72

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1b

    if-lt v0, v1, :cond_9

    goto :goto_72

    :cond_9
    iget-object v0, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    sget v1, Landroid/support/compat/R$dimen;->compat_notification_large_icon_max_width:I

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    sget v2, Landroid/support/compat/R$dimen;->compat_notification_large_icon_max_height:I

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    if-gt v2, v1, :cond_28

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    if-gt v2, v0, :cond_28

    return-object p1

    :cond_28
    int-to-double v1, v1

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    const/4 v4, 0x1

    invoke-static {v4, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    int-to-double v5, v3

    invoke-static {v1, v2}, Ljava/lang/Double;->isNaN(D)Z

    invoke-static {v5, v6}, Ljava/lang/Double;->isNaN(D)Z

    div-double/2addr v1, v5

    int-to-double v5, v0

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    invoke-static {v4, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    int-to-double v7, v0

    invoke-static {v5, v6}, Ljava/lang/Double;->isNaN(D)Z

    invoke-static {v7, v8}, Ljava/lang/Double;->isNaN(D)Z

    div-double/2addr v5, v7

    invoke-static {v1, v2, v5, v6}, Ljava/lang/Math;->min(DD)D

    move-result-wide v0

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    int-to-double v2, v2

    invoke-static {v2, v3}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v2, v2, v0

    invoke-static {v2, v3}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v2

    double-to-int v2, v2

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    int-to-double v5, v3

    invoke-static {v5, v6}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v5, v5, v0

    invoke-static {v5, v6}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v0

    double-to-int v0, v0

    invoke-static {p1, v2, v0, v4}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object p1

    return-object p1

    :cond_72
    :goto_72
    return-object p1
.end method

.method private setFlag(IZ)V
    .registers 4

    if-eqz p2, :cond_a

    iget-object p2, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mNotification:Landroid/app/Notification;

    iget v0, p2, Landroid/app/Notification;->flags:I

    or-int/2addr p1, v0

    iput p1, p2, Landroid/app/Notification;->flags:I

    goto :goto_13

    :cond_a
    iget-object p2, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mNotification:Landroid/app/Notification;

    iget v0, p2, Landroid/app/Notification;->flags:I

    xor-int/lit8 p1, p1, -0x1

    and-int/2addr p1, v0

    iput p1, p2, Landroid/app/Notification;->flags:I

    :goto_13
    return-void
.end method


# virtual methods
.method public addAction(ILjava/lang/CharSequence;Landroid/app/PendingIntent;)Landroid/support/v4/app/NotificationCompat$Builder;
    .registers 6

    iget-object v0, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mActions:Ljava/util/ArrayList;

    new-instance v1, Landroid/support/v4/app/NotificationCompat$Action;

    invoke-direct {v1, p1, p2, p3}, Landroid/support/v4/app/NotificationCompat$Action;-><init>(ILjava/lang/CharSequence;Landroid/app/PendingIntent;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public addAction(Landroid/support/v4/app/NotificationCompat$Action;)Landroid/support/v4/app/NotificationCompat$Builder;
    .registers 3

    iget-object v0, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mActions:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public addExtras(Landroid/os/Bundle;)Landroid/support/v4/app/NotificationCompat$Builder;
    .registers 3

    if-eqz p1, :cond_13

    iget-object v0, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mExtras:Landroid/os/Bundle;

    if-nez v0, :cond_e

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0, p1}, Landroid/os/Bundle;-><init>(Landroid/os/Bundle;)V

    iput-object v0, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mExtras:Landroid/os/Bundle;

    goto :goto_13

    :cond_e
    iget-object v0, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mExtras:Landroid/os/Bundle;

    invoke-virtual {v0, p1}, Landroid/os/Bundle;->putAll(Landroid/os/Bundle;)V

    :cond_13
    :goto_13
    return-object p0
.end method

.method public addInvisibleAction(ILjava/lang/CharSequence;Landroid/app/PendingIntent;)Landroid/support/v4/app/NotificationCompat$Builder;
    .registers 5
    .annotation build Landroid/support/annotation/RequiresApi;
        value = 0x15
    .end annotation

    new-instance v0, Landroid/support/v4/app/NotificationCompat$Action;

    invoke-direct {v0, p1, p2, p3}, Landroid/support/v4/app/NotificationCompat$Action;-><init>(ILjava/lang/CharSequence;Landroid/app/PendingIntent;)V

    invoke-virtual {p0, v0}, Landroid/support/v4/app/NotificationCompat$Builder;->addInvisibleAction(Landroid/support/v4/app/NotificationCompat$Action;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object p1

    return-object p1
.end method

.method public addInvisibleAction(Landroid/support/v4/app/NotificationCompat$Action;)Landroid/support/v4/app/NotificationCompat$Builder;
    .registers 3
    .annotation build Landroid/support/annotation/RequiresApi;
        value = 0x15
    .end annotation

    iget-object v0, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mInvisibleActions:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public addPerson(Ljava/lang/String;)Landroid/support/v4/app/NotificationCompat$Builder;
    .registers 3

    iget-object v0, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mPeople:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public build()Landroid/app/Notification;
    .registers 2

    new-instance v0, Landroid/support/v4/app/NotificationCompatBuilder;

    invoke-direct {v0, p0}, Landroid/support/v4/app/NotificationCompatBuilder;-><init>(Landroid/support/v4/app/NotificationCompat$Builder;)V

    invoke-virtual {v0}, Landroid/support/v4/app/NotificationCompatBuilder;->build()Landroid/app/Notification;

    move-result-object v0

    return-object v0
.end method

.method public extend(Landroid/support/v4/app/NotificationCompat$Extender;)Landroid/support/v4/app/NotificationCompat$Builder;
    .registers 2

    invoke-interface {p1, p0}, Landroid/support/v4/app/NotificationCompat$Extender;->extend(Landroid/support/v4/app/NotificationCompat$Builder;)Landroid/support/v4/app/NotificationCompat$Builder;

    return-object p0
.end method

.method public getBigContentView()Landroid/widget/RemoteViews;
    .registers 2
    .annotation build Landroid/support/annotation/RestrictTo;
        value = {
            .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mBigContentView:Landroid/widget/RemoteViews;

    return-object v0
.end method

.method public getColor()I
    .registers 2
    .annotation build Landroid/support/annotation/RestrictTo;
        value = {
            .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
        }
    .end annotation

    iget v0, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mColor:I

    return v0
.end method

.method public getContentView()Landroid/widget/RemoteViews;
    .registers 2
    .annotation build Landroid/support/annotation/RestrictTo;
        value = {
            .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mContentView:Landroid/widget/RemoteViews;

    return-object v0
.end method

.method public getExtras()Landroid/os/Bundle;
    .registers 2

    iget-object v0, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mExtras:Landroid/os/Bundle;

    if-nez v0, :cond_b

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    iput-object v0, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mExtras:Landroid/os/Bundle;

    :cond_b
    iget-object v0, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mExtras:Landroid/os/Bundle;

    return-object v0
.end method

.method public getHeadsUpContentView()Landroid/widget/RemoteViews;
    .registers 2
    .annotation build Landroid/support/annotation/RestrictTo;
        value = {
            .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mHeadsUpContentView:Landroid/widget/RemoteViews;

    return-object v0
.end method

.method public getNotification()Landroid/app/Notification;
    .registers 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    invoke-virtual {p0}, Landroid/support/v4/app/NotificationCompat$Builder;->build()Landroid/app/Notification;

    move-result-object v0

    return-object v0
.end method

.method public getPriority()I
    .registers 2
    .annotation build Landroid/support/annotation/RestrictTo;
        value = {
            .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
        }
    .end annotation

    iget v0, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mPriority:I

    return v0
.end method

.method public getWhenIfShowing()J
    .registers 3
    .annotation build Landroid/support/annotation/RestrictTo;
        value = {
            .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
        }
    .end annotation

    iget-boolean v0, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mShowWhen:Z

    if-eqz v0, :cond_9

    iget-object v0, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mNotification:Landroid/app/Notification;

    iget-wide v0, v0, Landroid/app/Notification;->when:J

    goto :goto_b

    :cond_9
    const-wide/16 v0, 0x0

    :goto_b
    return-wide v0
.end method

.method public setAutoCancel(Z)Landroid/support/v4/app/NotificationCompat$Builder;
    .registers 3

    const/16 v0, 0x10

    invoke-direct {p0, v0, p1}, Landroid/support/v4/app/NotificationCompat$Builder;->setFlag(IZ)V

    return-object p0
.end method

.method public setBadgeIconType(I)Landroid/support/v4/app/NotificationCompat$Builder;
    .registers 2

    iput p1, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mBadgeIcon:I

    return-object p0
.end method

.method public setCategory(Ljava/lang/String;)Landroid/support/v4/app/NotificationCompat$Builder;
    .registers 2

    iput-object p1, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mCategory:Ljava/lang/String;

    return-object p0
.end method

.method public setChannelId(Ljava/lang/String;)Landroid/support/v4/app/NotificationCompat$Builder;
    .registers 2
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iput-object p1, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mChannelId:Ljava/lang/String;

    return-object p0
.end method

.method public setColor(I)Landroid/support/v4/app/NotificationCompat$Builder;
    .registers 2
    .param p1    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    iput p1, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mColor:I

    return-object p0
.end method

.method public setColorized(Z)Landroid/support/v4/app/NotificationCompat$Builder;
    .registers 2

    iput-boolean p1, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mColorized:Z

    const/4 p1, 0x1

    iput-boolean p1, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mColorizedSet:Z

    return-object p0
.end method

.method public setContent(Landroid/widget/RemoteViews;)Landroid/support/v4/app/NotificationCompat$Builder;
    .registers 3

    iget-object v0, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mNotification:Landroid/app/Notification;

    iput-object p1, v0, Landroid/app/Notification;->contentView:Landroid/widget/RemoteViews;

    return-object p0
.end method

.method public setContentInfo(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;
    .registers 2

    invoke-static {p1}, Landroid/support/v4/app/NotificationCompat$Builder;->limitCharSequenceLength(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p1

    iput-object p1, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mContentInfo:Ljava/lang/CharSequence;

    return-object p0
.end method

.method public setContentIntent(Landroid/app/PendingIntent;)Landroid/support/v4/app/NotificationCompat$Builder;
    .registers 2

    iput-object p1, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mContentIntent:Landroid/app/PendingIntent;

    return-object p0
.end method

.method public setContentText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;
    .registers 2

    invoke-static {p1}, Landroid/support/v4/app/NotificationCompat$Builder;->limitCharSequenceLength(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p1

    iput-object p1, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mContentText:Ljava/lang/CharSequence;

    return-object p0
.end method

.method public setContentTitle(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;
    .registers 2

    invoke-static {p1}, Landroid/support/v4/app/NotificationCompat$Builder;->limitCharSequenceLength(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p1

    iput-object p1, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mContentTitle:Ljava/lang/CharSequence;

    return-object p0
.end method

.method public setCustomBigContentView(Landroid/widget/RemoteViews;)Landroid/support/v4/app/NotificationCompat$Builder;
    .registers 2

    iput-object p1, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mBigContentView:Landroid/widget/RemoteViews;

    return-object p0
.end method

.method public setCustomContentView(Landroid/widget/RemoteViews;)Landroid/support/v4/app/NotificationCompat$Builder;
    .registers 2

    iput-object p1, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mContentView:Landroid/widget/RemoteViews;

    return-object p0
.end method

.method public setCustomHeadsUpContentView(Landroid/widget/RemoteViews;)Landroid/support/v4/app/NotificationCompat$Builder;
    .registers 2

    iput-object p1, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mHeadsUpContentView:Landroid/widget/RemoteViews;

    return-object p0
.end method

.method public setDefaults(I)Landroid/support/v4/app/NotificationCompat$Builder;
    .registers 3

    iget-object v0, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mNotification:Landroid/app/Notification;

    iput p1, v0, Landroid/app/Notification;->defaults:I

    and-int/lit8 p1, p1, 0x4

    if-eqz p1, :cond_10

    iget-object p1, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mNotification:Landroid/app/Notification;

    iget v0, p1, Landroid/app/Notification;->flags:I

    or-int/lit8 v0, v0, 0x1

    iput v0, p1, Landroid/app/Notification;->flags:I

    :cond_10
    return-object p0
.end method

.method public setDeleteIntent(Landroid/app/PendingIntent;)Landroid/support/v4/app/NotificationCompat$Builder;
    .registers 3

    iget-object v0, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mNotification:Landroid/app/Notification;

    iput-object p1, v0, Landroid/app/Notification;->deleteIntent:Landroid/app/PendingIntent;

    return-object p0
.end method

.method public setExtras(Landroid/os/Bundle;)Landroid/support/v4/app/NotificationCompat$Builder;
    .registers 2

    iput-object p1, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mExtras:Landroid/os/Bundle;

    return-object p0
.end method

.method public setFullScreenIntent(Landroid/app/PendingIntent;Z)Landroid/support/v4/app/NotificationCompat$Builder;
    .registers 3

    iput-object p1, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mFullScreenIntent:Landroid/app/PendingIntent;

    const/16 p1, 0x80

    invoke-direct {p0, p1, p2}, Landroid/support/v4/app/NotificationCompat$Builder;->setFlag(IZ)V

    return-object p0
.end method

.method public setGroup(Ljava/lang/String;)Landroid/support/v4/app/NotificationCompat$Builder;
    .registers 2

    iput-object p1, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mGroupKey:Ljava/lang/String;

    return-object p0
.end method

.method public setGroupAlertBehavior(I)Landroid/support/v4/app/NotificationCompat$Builder;
    .registers 2

    iput p1, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mGroupAlertBehavior:I

    return-object p0
.end method

.method public setGroupSummary(Z)Landroid/support/v4/app/NotificationCompat$Builder;
    .registers 2

    iput-boolean p1, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mGroupSummary:Z

    return-object p0
.end method

.method public setLargeIcon(Landroid/graphics/Bitmap;)Landroid/support/v4/app/NotificationCompat$Builder;
    .registers 2

    invoke-direct {p0, p1}, Landroid/support/v4/app/NotificationCompat$Builder;->reduceLargeIconSize(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object p1

    iput-object p1, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mLargeIcon:Landroid/graphics/Bitmap;

    return-object p0
.end method

.method public setLights(III)Landroid/support/v4/app/NotificationCompat$Builder;
    .registers 5
    .param p1    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    iget-object v0, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mNotification:Landroid/app/Notification;

    iput p1, v0, Landroid/app/Notification;->ledARGB:I

    iget-object p1, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mNotification:Landroid/app/Notification;

    iput p2, p1, Landroid/app/Notification;->ledOnMS:I

    iget-object p1, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mNotification:Landroid/app/Notification;

    iput p3, p1, Landroid/app/Notification;->ledOffMS:I

    iget-object p1, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mNotification:Landroid/app/Notification;

    iget p1, p1, Landroid/app/Notification;->ledOnMS:I

    if-eqz p1, :cond_1a

    iget-object p1, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mNotification:Landroid/app/Notification;

    iget p1, p1, Landroid/app/Notification;->ledOffMS:I

    if-eqz p1, :cond_1a

    const/4 p1, 0x1

    goto :goto_1b

    :cond_1a
    const/4 p1, 0x0

    :goto_1b
    iget-object p2, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mNotification:Landroid/app/Notification;

    iget-object p3, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mNotification:Landroid/app/Notification;

    iget p3, p3, Landroid/app/Notification;->flags:I

    and-int/lit8 p3, p3, -0x2

    or-int/2addr p1, p3

    iput p1, p2, Landroid/app/Notification;->flags:I

    return-object p0
.end method

.method public setLocalOnly(Z)Landroid/support/v4/app/NotificationCompat$Builder;
    .registers 2

    iput-boolean p1, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mLocalOnly:Z

    return-object p0
.end method

.method public setNumber(I)Landroid/support/v4/app/NotificationCompat$Builder;
    .registers 2

    iput p1, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mNumber:I

    return-object p0
.end method

.method public setOngoing(Z)Landroid/support/v4/app/NotificationCompat$Builder;
    .registers 3

    const/4 v0, 0x2

    invoke-direct {p0, v0, p1}, Landroid/support/v4/app/NotificationCompat$Builder;->setFlag(IZ)V

    return-object p0
.end method

.method public setOnlyAlertOnce(Z)Landroid/support/v4/app/NotificationCompat$Builder;
    .registers 3

    const/16 v0, 0x8

    invoke-direct {p0, v0, p1}, Landroid/support/v4/app/NotificationCompat$Builder;->setFlag(IZ)V

    return-object p0
.end method

.method public setPriority(I)Landroid/support/v4/app/NotificationCompat$Builder;
    .registers 2

    iput p1, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mPriority:I

    return-object p0
.end method

.method public setProgress(IIZ)Landroid/support/v4/app/NotificationCompat$Builder;
    .registers 4

    iput p1, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mProgressMax:I

    iput p2, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mProgress:I

    iput-boolean p3, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mProgressIndeterminate:Z

    return-object p0
.end method

.method public setPublicVersion(Landroid/app/Notification;)Landroid/support/v4/app/NotificationCompat$Builder;
    .registers 2

    iput-object p1, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mPublicVersion:Landroid/app/Notification;

    return-object p0
.end method

.method public setRemoteInputHistory([Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;
    .registers 2

    iput-object p1, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mRemoteInputHistory:[Ljava/lang/CharSequence;

    return-object p0
.end method

.method public setShortcutId(Ljava/lang/String;)Landroid/support/v4/app/NotificationCompat$Builder;
    .registers 2

    iput-object p1, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mShortcutId:Ljava/lang/String;

    return-object p0
.end method

.method public setShowWhen(Z)Landroid/support/v4/app/NotificationCompat$Builder;
    .registers 2

    iput-boolean p1, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mShowWhen:Z

    return-object p0
.end method

.method public setSmallIcon(I)Landroid/support/v4/app/NotificationCompat$Builder;
    .registers 3

    iget-object v0, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mNotification:Landroid/app/Notification;

    iput p1, v0, Landroid/app/Notification;->icon:I

    return-object p0
.end method

.method public setSmallIcon(II)Landroid/support/v4/app/NotificationCompat$Builder;
    .registers 4

    iget-object v0, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mNotification:Landroid/app/Notification;

    iput p1, v0, Landroid/app/Notification;->icon:I

    iget-object p1, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mNotification:Landroid/app/Notification;

    iput p2, p1, Landroid/app/Notification;->iconLevel:I

    return-object p0
.end method

.method public setSortKey(Ljava/lang/String;)Landroid/support/v4/app/NotificationCompat$Builder;
    .registers 2

    iput-object p1, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mSortKey:Ljava/lang/String;

    return-object p0
.end method

.method public setSound(Landroid/net/Uri;)Landroid/support/v4/app/NotificationCompat$Builder;
    .registers 4

    iget-object v0, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mNotification:Landroid/app/Notification;

    iput-object p1, v0, Landroid/app/Notification;->sound:Landroid/net/Uri;

    iget-object p1, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mNotification:Landroid/app/Notification;

    const/4 v0, -0x1

    iput v0, p1, Landroid/app/Notification;->audioStreamType:I

    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v0, 0x15

    if-lt p1, v0, :cond_26

    iget-object p1, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mNotification:Landroid/app/Notification;

    new-instance v0, Landroid/media/AudioAttributes$Builder;

    invoke-direct {v0}, Landroid/media/AudioAttributes$Builder;-><init>()V

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/media/AudioAttributes$Builder;->setContentType(I)Landroid/media/AudioAttributes$Builder;

    move-result-object v0

    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Landroid/media/AudioAttributes$Builder;->setUsage(I)Landroid/media/AudioAttributes$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/media/AudioAttributes$Builder;->build()Landroid/media/AudioAttributes;

    move-result-object v0

    iput-object v0, p1, Landroid/app/Notification;->audioAttributes:Landroid/media/AudioAttributes;

    :cond_26
    return-object p0
.end method

.method public setSound(Landroid/net/Uri;I)Landroid/support/v4/app/NotificationCompat$Builder;
    .registers 5

    iget-object v0, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mNotification:Landroid/app/Notification;

    iput-object p1, v0, Landroid/app/Notification;->sound:Landroid/net/Uri;

    iget-object p1, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mNotification:Landroid/app/Notification;

    iput p2, p1, Landroid/app/Notification;->audioStreamType:I

    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v0, 0x15

    if-lt p1, v0, :cond_24

    iget-object p1, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mNotification:Landroid/app/Notification;

    new-instance v0, Landroid/media/AudioAttributes$Builder;

    invoke-direct {v0}, Landroid/media/AudioAttributes$Builder;-><init>()V

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/media/AudioAttributes$Builder;->setContentType(I)Landroid/media/AudioAttributes$Builder;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroid/media/AudioAttributes$Builder;->setLegacyStreamType(I)Landroid/media/AudioAttributes$Builder;

    move-result-object p2

    invoke-virtual {p2}, Landroid/media/AudioAttributes$Builder;->build()Landroid/media/AudioAttributes;

    move-result-object p2

    iput-object p2, p1, Landroid/app/Notification;->audioAttributes:Landroid/media/AudioAttributes;

    :cond_24
    return-object p0
.end method

.method public setStyle(Landroid/support/v4/app/NotificationCompat$Style;)Landroid/support/v4/app/NotificationCompat$Builder;
    .registers 3

    iget-object v0, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mStyle:Landroid/support/v4/app/NotificationCompat$Style;

    if-eq v0, p1, :cond_f

    iput-object p1, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mStyle:Landroid/support/v4/app/NotificationCompat$Style;

    iget-object p1, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mStyle:Landroid/support/v4/app/NotificationCompat$Style;

    if-eqz p1, :cond_f

    iget-object p1, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mStyle:Landroid/support/v4/app/NotificationCompat$Style;

    invoke-virtual {p1, p0}, Landroid/support/v4/app/NotificationCompat$Style;->setBuilder(Landroid/support/v4/app/NotificationCompat$Builder;)V

    :cond_f
    return-object p0
.end method

.method public setSubText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;
    .registers 2

    invoke-static {p1}, Landroid/support/v4/app/NotificationCompat$Builder;->limitCharSequenceLength(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p1

    iput-object p1, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mSubText:Ljava/lang/CharSequence;

    return-object p0
.end method

.method public setTicker(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;
    .registers 3

    iget-object v0, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mNotification:Landroid/app/Notification;

    invoke-static {p1}, Landroid/support/v4/app/NotificationCompat$Builder;->limitCharSequenceLength(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p1

    iput-object p1, v0, Landroid/app/Notification;->tickerText:Ljava/lang/CharSequence;

    return-object p0
.end method

.method public setTicker(Ljava/lang/CharSequence;Landroid/widget/RemoteViews;)Landroid/support/v4/app/NotificationCompat$Builder;
    .registers 4

    iget-object v0, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mNotification:Landroid/app/Notification;

    invoke-static {p1}, Landroid/support/v4/app/NotificationCompat$Builder;->limitCharSequenceLength(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p1

    iput-object p1, v0, Landroid/app/Notification;->tickerText:Ljava/lang/CharSequence;

    iput-object p2, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mTickerView:Landroid/widget/RemoteViews;

    return-object p0
.end method

.method public setTimeoutAfter(J)Landroid/support/v4/app/NotificationCompat$Builder;
    .registers 3

    iput-wide p1, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mTimeout:J

    return-object p0
.end method

.method public setUsesChronometer(Z)Landroid/support/v4/app/NotificationCompat$Builder;
    .registers 2

    iput-boolean p1, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mUseChronometer:Z

    return-object p0
.end method

.method public setVibrate([J)Landroid/support/v4/app/NotificationCompat$Builder;
    .registers 3

    iget-object v0, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mNotification:Landroid/app/Notification;

    iput-object p1, v0, Landroid/app/Notification;->vibrate:[J

    return-object p0
.end method

.method public setVisibility(I)Landroid/support/v4/app/NotificationCompat$Builder;
    .registers 2

    iput p1, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mVisibility:I

    return-object p0
.end method

.method public setWhen(J)Landroid/support/v4/app/NotificationCompat$Builder;
    .registers 4

    iget-object v0, p0, Landroid/support/v4/app/NotificationCompat$Builder;->mNotification:Landroid/app/Notification;

    iput-wide p1, v0, Landroid/app/Notification;->when:J

    return-object p0
.end method
