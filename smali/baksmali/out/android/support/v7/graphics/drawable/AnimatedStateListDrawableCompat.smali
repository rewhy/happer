.class public Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat;
.super Landroid/support/v7/graphics/drawable/StateListDrawable;
.source "AnimatedStateListDrawableCompat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$FrameInterpolator;,
        Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$AnimatedStateListState;,
        Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$AnimatedVectorDrawableTransition;,
        Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$AnimationDrawableTransition;,
        Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$AnimatableTransition;,
        Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$Transition;
    }
.end annotation


# static fields
.field private static final ELEMENT_ITEM:Ljava/lang/String; = "item"

.field private static final ELEMENT_TRANSITION:Ljava/lang/String; = "transition"

.field private static final ITEM_MISSING_DRAWABLE_ERROR:Ljava/lang/String; = ": <item> tag requires a \'drawable\' attribute or child tag defining a drawable"

.field private static final LOGTAG:Ljava/lang/String; = "AnimatedStateListDrawableCompat"

.field private static final TRANSITION_MISSING_DRAWABLE_ERROR:Ljava/lang/String; = ": <transition> tag requires a \'drawable\' attribute or child tag defining a drawable"

.field private static final TRANSITION_MISSING_FROM_TO_ID:Ljava/lang/String; = ": <transition> tag requires \'fromId\' & \'toId\' attributes"


# instance fields
.field private mMutated:Z

.field private mState:Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$AnimatedStateListState;

.field private mTransition:Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$Transition;

.field private mTransitionFromIndex:I

.field private mTransitionToIndex:I


# direct methods
.method static constructor <clinit>()V
    .registers 0

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    const/4 v0, 0x0

    invoke-direct {p0, v0, v0}, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat;-><init>(Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$AnimatedStateListState;Landroid/content/res/Resources;)V

    return-void
.end method

.method constructor <init>(Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$AnimatedStateListState;Landroid/content/res/Resources;)V
    .registers 4
    .param p1    # Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$AnimatedStateListState;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Landroid/content/res/Resources;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Landroid/support/v7/graphics/drawable/StateListDrawable;-><init>(Landroid/support/v7/graphics/drawable/StateListDrawable$StateListState;)V

    const/4 v0, -0x1

    iput v0, p0, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat;->mTransitionToIndex:I

    iput v0, p0, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat;->mTransitionFromIndex:I

    new-instance v0, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$AnimatedStateListState;

    invoke-direct {v0, p1, p0, p2}, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$AnimatedStateListState;-><init>(Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$AnimatedStateListState;Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat;Landroid/content/res/Resources;)V

    invoke-virtual {p0, v0}, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat;->setConstantState(Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;)V

    invoke-virtual {p0}, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat;->getState()[I

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat;->onStateChange([I)Z

    invoke-virtual {p0}, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat;->jumpToCurrentState()V

    return-void
.end method

.method public static create(Landroid/content/Context;ILandroid/content/res/Resources$Theme;)Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat;
    .registers 8
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param
    .param p2    # Landroid/content/res/Resources$Theme;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getXml(I)Landroid/content/res/XmlResourceParser;

    move-result-object p1

    invoke-static {p1}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    move-result-object v1

    :goto_c
    invoke-interface {p1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v2

    const/4 v3, 0x2

    if-eq v2, v3, :cond_17

    const/4 v4, 0x1

    if-eq v2, v4, :cond_17

    goto :goto_c

    :cond_17
    if-ne v2, v3, :cond_1e

    invoke-static {p0, v0, p1, v1, p2}, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat;->createFromXmlInner(Landroid/content/Context;Landroid/content/res/Resources;Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;Landroid/content/res/Resources$Theme;)Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat;

    move-result-object p0

    return-object p0

    :cond_1e
    new-instance p0, Lorg/xmlpull/v1/XmlPullParserException;

    const-string p1, "No start tag found"

    invoke-direct {p0, p1}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_26
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_26} :catch_2f
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_26} :catch_26

    :catch_26
    move-exception p0

    sget-object p1, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat;->LOGTAG:Ljava/lang/String;

    const-string p2, "parser error"

    invoke-static {p1, p2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_37

    :catch_2f
    move-exception p0

    sget-object p1, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat;->LOGTAG:Ljava/lang/String;

    const-string p2, "parser error"

    invoke-static {p1, p2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_37
    const/4 p0, 0x0

    return-object p0
.end method

.method public static createFromXmlInner(Landroid/content/Context;Landroid/content/res/Resources;Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;Landroid/content/res/Resources$Theme;)Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat;
    .registers 13
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Landroid/content/res/Resources;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lorg/xmlpull/v1/XmlPullParser;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Landroid/content/res/Resources$Theme;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/xmlpull/v1/XmlPullParserException;
        }
    .end annotation

    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v1, "animated-selector"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1b

    new-instance v0, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat;

    invoke-direct {v0}, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat;-><init>()V

    move-object v2, v0

    move-object v3, p0

    move-object v4, p1

    move-object v5, p2

    move-object v6, p3

    move-object v7, p4

    invoke-virtual/range {v2 .. v7}, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat;->inflate(Landroid/content/Context;Landroid/content/res/Resources;Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;Landroid/content/res/Resources$Theme;)V

    return-object v0

    :cond_1b
    new-instance p0, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getPositionDescription()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, ": invalid animated-selector tag "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private inflateChildElements(Landroid/content/Context;Landroid/content/res/Resources;Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;Landroid/content/res/Resources$Theme;)V
    .registers 11
    .param p1    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/content/res/Resources;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Lorg/xmlpull/v1/XmlPullParser;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p5    # Landroid/content/res/Resources$Theme;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    invoke-interface {p3}, Lorg/xmlpull/v1/XmlPullParser;->getDepth()I

    move-result v0

    const/4 v1, 0x1

    add-int/2addr v0, v1

    :cond_6
    :goto_6
    invoke-interface {p3}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v2

    if-eq v2, v1, :cond_3c

    invoke-interface {p3}, Lorg/xmlpull/v1/XmlPullParser;->getDepth()I

    move-result v3

    if-ge v3, v0, :cond_15

    const/4 v4, 0x3

    if-eq v2, v4, :cond_3c

    :cond_15
    const/4 v4, 0x2

    if-eq v2, v4, :cond_19

    goto :goto_6

    :cond_19
    if-le v3, v0, :cond_1c

    goto :goto_6

    :cond_1c
    invoke-interface {p3}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "item"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2c

    invoke-direct/range {p0 .. p5}, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat;->parseItem(Landroid/content/Context;Landroid/content/res/Resources;Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;Landroid/content/res/Resources$Theme;)I

    goto :goto_6

    :cond_2c
    invoke-interface {p3}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "transition"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    invoke-direct/range {p0 .. p5}, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat;->parseTransition(Landroid/content/Context;Landroid/content/res/Resources;Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;Landroid/content/res/Resources$Theme;)I

    goto :goto_6

    :cond_3c
    return-void
.end method

.method private init()V
    .registers 2

    invoke-virtual {p0}, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat;->getState()[I

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat;->onStateChange([I)Z

    return-void
.end method

.method private parseItem(Landroid/content/Context;Landroid/content/res/Resources;Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;Landroid/content/res/Resources$Theme;)I
    .registers 10
    .param p1    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/content/res/Resources;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Lorg/xmlpull/v1/XmlPullParser;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p5    # Landroid/content/res/Resources$Theme;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Landroid/support/v7/appcompat/R$styleable;->AnimatedStateListDrawableItem:[I

    invoke-static {p2, p5, p4, v0}, Landroid/support/v4/content/res/TypedArrayUtils;->obtainAttributes(Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    sget v1, Landroid/support/v7/appcompat/R$styleable;->AnimatedStateListDrawableItem_android_id:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v1

    sget v2, Landroid/support/v7/appcompat/R$styleable;->AnimatedStateListDrawableItem_android_drawable:I

    const/4 v3, -0x1

    invoke-virtual {v0, v2, v3}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v2

    if-lez v2, :cond_1b

    invoke-static {p1, v2}, Landroid/support/v7/content/res/AppCompatResources;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    goto :goto_1c

    :cond_1b
    const/4 p1, 0x0

    :goto_1c
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    invoke-virtual {p0, p4}, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat;->extractStateSet(Landroid/util/AttributeSet;)[I

    move-result-object v0

    if-nez p1, :cond_6c

    :goto_25
    invoke-interface {p3}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result p1

    const/4 v2, 0x4

    if-ne p1, v2, :cond_2d

    goto :goto_25

    :cond_2d
    const/4 v2, 0x2

    if-ne p1, v2, :cond_51

    invoke-interface {p3}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object p1

    const-string v2, "vector"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_41

    invoke-static {p2, p3, p4, p5}, Landroid/support/graphics/drawable/VectorDrawableCompat;->createFromXmlInner(Landroid/content/res/Resources;Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;Landroid/content/res/Resources$Theme;)Landroid/support/graphics/drawable/VectorDrawableCompat;

    move-result-object p1

    goto :goto_6c

    :cond_41
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x15

    if-lt p1, v2, :cond_4c

    invoke-static {p2, p3, p4, p5}, Landroid/graphics/drawable/Drawable;->createFromXmlInner(Landroid/content/res/Resources;Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;Landroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    goto :goto_6c

    :cond_4c
    invoke-static {p2, p3, p4}, Landroid/graphics/drawable/Drawable;->createFromXmlInner(Landroid/content/res/Resources;Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    goto :goto_6c

    :cond_51
    new-instance p1, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {p3}, Lorg/xmlpull/v1/XmlPullParser;->getPositionDescription()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, ": <item> tag requires a \'drawable\' attribute or child tag defining a drawable"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_6c
    :goto_6c
    if-eqz p1, :cond_75

    iget-object p2, p0, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat;->mState:Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$AnimatedStateListState;

    invoke-virtual {p2, v0, p1, v1}, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$AnimatedStateListState;->addStateSet([ILandroid/graphics/drawable/Drawable;I)I

    move-result p1

    return p1

    :cond_75
    new-instance p1, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {p3}, Lorg/xmlpull/v1/XmlPullParser;->getPositionDescription()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, ": <item> tag requires a \'drawable\' attribute or child tag defining a drawable"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private parseTransition(Landroid/content/Context;Landroid/content/res/Resources;Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;Landroid/content/res/Resources$Theme;)I
    .registers 13
    .param p1    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/content/res/Resources;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Lorg/xmlpull/v1/XmlPullParser;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p5    # Landroid/content/res/Resources$Theme;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Landroid/support/v7/appcompat/R$styleable;->AnimatedStateListDrawableTransition:[I

    invoke-static {p2, p5, p4, v0}, Landroid/support/v4/content/res/TypedArrayUtils;->obtainAttributes(Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    sget v1, Landroid/support/v7/appcompat/R$styleable;->AnimatedStateListDrawableTransition_android_fromId:I

    const/4 v2, -0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v1

    sget v3, Landroid/support/v7/appcompat/R$styleable;->AnimatedStateListDrawableTransition_android_toId:I

    invoke-virtual {v0, v3, v2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v3

    sget v4, Landroid/support/v7/appcompat/R$styleable;->AnimatedStateListDrawableTransition_android_drawable:I

    invoke-virtual {v0, v4, v2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v4

    if-lez v4, :cond_20

    invoke-static {p1, v4}, Landroid/support/v7/content/res/AppCompatResources;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    goto :goto_21

    :cond_20
    const/4 v4, 0x0

    :goto_21
    sget v5, Landroid/support/v7/appcompat/R$styleable;->AnimatedStateListDrawableTransition_android_reversible:I

    const/4 v6, 0x0

    invoke-virtual {v0, v5, v6}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v5

    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    if-nez v4, :cond_74

    :goto_2d
    invoke-interface {p3}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v0

    const/4 v4, 0x4

    if-ne v0, v4, :cond_35

    goto :goto_2d

    :cond_35
    const/4 v4, 0x2

    if-ne v0, v4, :cond_59

    invoke-interface {p3}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v4, "animated-vector"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_49

    invoke-static {p1, p2, p3, p4, p5}, Landroid/support/graphics/drawable/AnimatedVectorDrawableCompat;->createFromXmlInner(Landroid/content/Context;Landroid/content/res/Resources;Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;Landroid/content/res/Resources$Theme;)Landroid/support/graphics/drawable/AnimatedVectorDrawableCompat;

    move-result-object v4

    goto :goto_74

    :cond_49
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v0, 0x15

    if-lt p1, v0, :cond_54

    invoke-static {p2, p3, p4, p5}, Landroid/graphics/drawable/Drawable;->createFromXmlInner(Landroid/content/res/Resources;Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;Landroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    goto :goto_74

    :cond_54
    invoke-static {p2, p3, p4}, Landroid/graphics/drawable/Drawable;->createFromXmlInner(Landroid/content/res/Resources;Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    goto :goto_74

    :cond_59
    new-instance p1, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {p3}, Lorg/xmlpull/v1/XmlPullParser;->getPositionDescription()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, ": <transition> tag requires a \'drawable\' attribute or child tag defining a drawable"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_74
    :goto_74
    if-eqz v4, :cond_9c

    if-eq v1, v2, :cond_81

    if-eq v3, v2, :cond_81

    iget-object p1, p0, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat;->mState:Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$AnimatedStateListState;

    invoke-virtual {p1, v1, v3, v4, v5}, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$AnimatedStateListState;->addTransition(IILandroid/graphics/drawable/Drawable;Z)I

    move-result p1

    return p1

    :cond_81
    new-instance p1, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {p3}, Lorg/xmlpull/v1/XmlPullParser;->getPositionDescription()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, ": <transition> tag requires \'fromId\' & \'toId\' attributes"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_9c
    new-instance p1, Lorg/xmlpull/v1/XmlPullParserException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {p3}, Lorg/xmlpull/v1/XmlPullParser;->getPositionDescription()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, ": <transition> tag requires a \'drawable\' attribute or child tag defining a drawable"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Lorg/xmlpull/v1/XmlPullParserException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private selectTransition(I)Z
    .registers 11

    iget-object v0, p0, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat;->mTransition:Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$Transition;

    const/4 v1, 0x1

    if-eqz v0, :cond_24

    iget v2, p0, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat;->mTransitionToIndex:I

    if-ne p1, v2, :cond_a

    return v1

    :cond_a
    iget v2, p0, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat;->mTransitionFromIndex:I

    if-ne p1, v2, :cond_1e

    invoke-virtual {v0}, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$Transition;->canReverse()Z

    move-result v2

    if-eqz v2, :cond_1e

    invoke-virtual {v0}, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$Transition;->reverse()V

    iget v0, p0, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat;->mTransitionFromIndex:I

    iput v0, p0, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat;->mTransitionToIndex:I

    iput p1, p0, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat;->mTransitionFromIndex:I

    return v1

    :cond_1e
    iget v2, p0, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat;->mTransitionToIndex:I

    invoke-virtual {v0}, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$Transition;->stop()V

    goto :goto_28

    :cond_24
    invoke-virtual {p0}, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat;->getCurrentIndex()I

    move-result v2

    :goto_28
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat;->mTransition:Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$Transition;

    const/4 v0, -0x1

    iput v0, p0, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat;->mTransitionFromIndex:I

    iput v0, p0, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat;->mTransitionToIndex:I

    iget-object v0, p0, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat;->mState:Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$AnimatedStateListState;

    invoke-virtual {v0, v2}, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$AnimatedStateListState;->getKeyframeIdAt(I)I

    move-result v3

    invoke-virtual {v0, p1}, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$AnimatedStateListState;->getKeyframeIdAt(I)I

    move-result v4

    const/4 v5, 0x0

    if-eqz v4, :cond_84

    if-nez v3, :cond_40

    goto :goto_84

    :cond_40
    invoke-virtual {v0, v3, v4}, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$AnimatedStateListState;->indexOfTransition(II)I

    move-result v6

    if-gez v6, :cond_47

    return v5

    :cond_47
    invoke-virtual {v0, v3, v4}, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$AnimatedStateListState;->transitionHasReversibleFlag(II)Z

    move-result v7

    invoke-virtual {p0, v6}, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat;->selectDrawable(I)Z

    invoke-virtual {p0}, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat;->getCurrent()Landroid/graphics/drawable/Drawable;

    move-result-object v6

    instance-of v8, v6, Landroid/graphics/drawable/AnimationDrawable;

    if-eqz v8, :cond_62

    invoke-virtual {v0, v3, v4}, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$AnimatedStateListState;->isTransitionReversed(II)Z

    move-result v0

    new-instance v3, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$AnimationDrawableTransition;

    check-cast v6, Landroid/graphics/drawable/AnimationDrawable;

    invoke-direct {v3, v6, v0, v7}, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$AnimationDrawableTransition;-><init>(Landroid/graphics/drawable/AnimationDrawable;ZZ)V

    goto :goto_79

    :cond_62
    instance-of v0, v6, Landroid/support/graphics/drawable/AnimatedVectorDrawableCompat;

    if-eqz v0, :cond_6e

    new-instance v3, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$AnimatedVectorDrawableTransition;

    check-cast v6, Landroid/support/graphics/drawable/AnimatedVectorDrawableCompat;

    invoke-direct {v3, v6}, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$AnimatedVectorDrawableTransition;-><init>(Landroid/support/graphics/drawable/AnimatedVectorDrawableCompat;)V

    goto :goto_79

    :cond_6e
    instance-of v0, v6, Landroid/graphics/drawable/Animatable;

    if-eqz v0, :cond_83

    new-instance v3, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$AnimatableTransition;

    check-cast v6, Landroid/graphics/drawable/Animatable;

    invoke-direct {v3, v6}, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$AnimatableTransition;-><init>(Landroid/graphics/drawable/Animatable;)V

    :goto_79
    invoke-virtual {v3}, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$Transition;->start()V

    iput-object v3, p0, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat;->mTransition:Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$Transition;

    iput v2, p0, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat;->mTransitionFromIndex:I

    iput p1, p0, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat;->mTransitionToIndex:I

    return v1

    :cond_83
    return v5

    :cond_84
    :goto_84
    return v5
.end method

.method private updateStateFromTypedArray(Landroid/content/res/TypedArray;)V
    .registers 5

    iget-object v0, p0, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat;->mState:Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$AnimatedStateListState;

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x15

    if-lt v1, v2, :cond_11

    iget v1, v0, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$AnimatedStateListState;->mChangingConfigurations:I

    invoke-virtual {p1}, Landroid/content/res/TypedArray;->getChangingConfigurations()I

    move-result v2

    or-int/2addr v1, v2

    iput v1, v0, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$AnimatedStateListState;->mChangingConfigurations:I

    :cond_11
    sget v1, Landroid/support/v7/appcompat/R$styleable;->AnimatedStateListDrawableCompat_android_variablePadding:I

    iget-boolean v2, v0, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$AnimatedStateListState;->mVariablePadding:Z

    invoke-virtual {p1, v1, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$AnimatedStateListState;->setVariablePadding(Z)V

    sget v1, Landroid/support/v7/appcompat/R$styleable;->AnimatedStateListDrawableCompat_android_constantSize:I

    iget-boolean v2, v0, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$AnimatedStateListState;->mConstantSize:Z

    invoke-virtual {p1, v1, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$AnimatedStateListState;->setConstantSize(Z)V

    sget v1, Landroid/support/v7/appcompat/R$styleable;->AnimatedStateListDrawableCompat_android_enterFadeDuration:I

    iget v2, v0, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$AnimatedStateListState;->mEnterFadeDuration:I

    invoke-virtual {p1, v1, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$AnimatedStateListState;->setEnterFadeDuration(I)V

    sget v1, Landroid/support/v7/appcompat/R$styleable;->AnimatedStateListDrawableCompat_android_exitFadeDuration:I

    iget v2, v0, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$AnimatedStateListState;->mExitFadeDuration:I

    invoke-virtual {p1, v1, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$AnimatedStateListState;->setExitFadeDuration(I)V

    sget v1, Landroid/support/v7/appcompat/R$styleable;->AnimatedStateListDrawableCompat_android_dither:I

    iget-boolean v0, v0, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$AnimatedStateListState;->mDither:Z

    invoke-virtual {p1, v1, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p1

    invoke-virtual {p0, p1}, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat;->setDither(Z)V

    return-void
.end method


# virtual methods
.method public bridge synthetic addState([ILandroid/graphics/drawable/Drawable;)V
    .registers 3

    invoke-super {p0, p1, p2}, Landroid/support/v7/graphics/drawable/StateListDrawable;->addState([ILandroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public addState([ILandroid/graphics/drawable/Drawable;I)V
    .registers 5
    .param p1    # [I
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    if-eqz p2, :cond_f

    iget-object v0, p0, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat;->mState:Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$AnimatedStateListState;

    invoke-virtual {v0, p1, p2, p3}, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$AnimatedStateListState;->addStateSet([ILandroid/graphics/drawable/Drawable;I)I

    invoke-virtual {p0}, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat;->getState()[I

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat;->onStateChange([I)Z

    return-void

    :cond_f
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Drawable must not be null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public addTransition(IILandroid/graphics/drawable/Drawable;Z)V
    .registers 6
    .param p3    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Landroid/graphics/drawable/Drawable;",
            ":",
            "Landroid/graphics/drawable/Animatable;",
            ">(IITT;Z)V"
        }
    .end annotation

    if-eqz p3, :cond_8

    iget-object v0, p0, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat;->mState:Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$AnimatedStateListState;

    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$AnimatedStateListState;->addTransition(IILandroid/graphics/drawable/Drawable;Z)I

    return-void

    :cond_8
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Transition drawable must not be null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public bridge synthetic applyTheme(Landroid/content/res/Resources$Theme;)V
    .registers 2
    .param p1    # Landroid/content/res/Resources$Theme;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/RequiresApi;
        value = 0x15
    .end annotation

    invoke-super {p0, p1}, Landroid/support/v7/graphics/drawable/StateListDrawable;->applyTheme(Landroid/content/res/Resources$Theme;)V

    return-void
.end method

.method public bridge synthetic canApplyTheme()Z
    .registers 2
    .annotation build Landroid/support/annotation/RequiresApi;
        value = 0x15
    .end annotation

    invoke-super {p0}, Landroid/support/v7/graphics/drawable/StateListDrawable;->canApplyTheme()Z

    move-result v0

    return v0
.end method

.method clearMutated()V
    .registers 2

    invoke-super {p0}, Landroid/support/v7/graphics/drawable/StateListDrawable;->clearMutated()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat;->mMutated:Z

    return-void
.end method

.method cloneConstantState()Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$AnimatedStateListState;
    .registers 4

    new-instance v0, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$AnimatedStateListState;

    iget-object v1, p0, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat;->mState:Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$AnimatedStateListState;

    const/4 v2, 0x0

    invoke-direct {v0, v1, p0, v2}, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$AnimatedStateListState;-><init>(Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$AnimatedStateListState;Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat;Landroid/content/res/Resources;)V

    return-object v0
.end method

.method bridge synthetic cloneConstantState()Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;
    .registers 2

    invoke-virtual {p0}, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat;->cloneConstantState()Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$AnimatedStateListState;

    move-result-object v0

    return-object v0
.end method

.method bridge synthetic cloneConstantState()Landroid/support/v7/graphics/drawable/StateListDrawable$StateListState;
    .registers 2

    invoke-virtual {p0}, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat;->cloneConstantState()Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$AnimatedStateListState;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic draw(Landroid/graphics/Canvas;)V
    .registers 2
    .param p1    # Landroid/graphics/Canvas;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-super {p0, p1}, Landroid/support/v7/graphics/drawable/StateListDrawable;->draw(Landroid/graphics/Canvas;)V

    return-void
.end method

.method public bridge synthetic getAlpha()I
    .registers 2

    invoke-super {p0}, Landroid/support/v7/graphics/drawable/StateListDrawable;->getAlpha()I

    move-result v0

    return v0
.end method

.method public bridge synthetic getChangingConfigurations()I
    .registers 2

    invoke-super {p0}, Landroid/support/v7/graphics/drawable/StateListDrawable;->getChangingConfigurations()I

    move-result v0

    return v0
.end method

.method public bridge synthetic getCurrent()Landroid/graphics/drawable/Drawable;
    .registers 2
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    invoke-super {p0}, Landroid/support/v7/graphics/drawable/StateListDrawable;->getCurrent()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getHotspotBounds(Landroid/graphics/Rect;)V
    .registers 2
    .param p1    # Landroid/graphics/Rect;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-super {p0, p1}, Landroid/support/v7/graphics/drawable/StateListDrawable;->getHotspotBounds(Landroid/graphics/Rect;)V

    return-void
.end method

.method public bridge synthetic getIntrinsicHeight()I
    .registers 2

    invoke-super {p0}, Landroid/support/v7/graphics/drawable/StateListDrawable;->getIntrinsicHeight()I

    move-result v0

    return v0
.end method

.method public bridge synthetic getIntrinsicWidth()I
    .registers 2

    invoke-super {p0}, Landroid/support/v7/graphics/drawable/StateListDrawable;->getIntrinsicWidth()I

    move-result v0

    return v0
.end method

.method public bridge synthetic getMinimumHeight()I
    .registers 2

    invoke-super {p0}, Landroid/support/v7/graphics/drawable/StateListDrawable;->getMinimumHeight()I

    move-result v0

    return v0
.end method

.method public bridge synthetic getMinimumWidth()I
    .registers 2

    invoke-super {p0}, Landroid/support/v7/graphics/drawable/StateListDrawable;->getMinimumWidth()I

    move-result v0

    return v0
.end method

.method public bridge synthetic getOpacity()I
    .registers 2

    invoke-super {p0}, Landroid/support/v7/graphics/drawable/StateListDrawable;->getOpacity()I

    move-result v0

    return v0
.end method

.method public bridge synthetic getOutline(Landroid/graphics/Outline;)V
    .registers 2
    .param p1    # Landroid/graphics/Outline;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/RequiresApi;
        value = 0x15
    .end annotation

    invoke-super {p0, p1}, Landroid/support/v7/graphics/drawable/StateListDrawable;->getOutline(Landroid/graphics/Outline;)V

    return-void
.end method

.method public bridge synthetic getPadding(Landroid/graphics/Rect;)Z
    .registers 2
    .param p1    # Landroid/graphics/Rect;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-super {p0, p1}, Landroid/support/v7/graphics/drawable/StateListDrawable;->getPadding(Landroid/graphics/Rect;)Z

    move-result p1

    return p1
.end method

.method public inflate(Landroid/content/Context;Landroid/content/res/Resources;Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;Landroid/content/res/Resources$Theme;)V
    .registers 9
    .param p1    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/content/res/Resources;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Lorg/xmlpull/v1/XmlPullParser;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p5    # Landroid/content/res/Resources$Theme;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Landroid/support/v7/appcompat/R$styleable;->AnimatedStateListDrawableCompat:[I

    invoke-static {p2, p5, p4, v0}, Landroid/support/v4/content/res/TypedArrayUtils;->obtainAttributes(Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    sget v1, Landroid/support/v7/appcompat/R$styleable;->AnimatedStateListDrawableCompat_android_visible:I

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    invoke-virtual {p0, v1, v2}, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat;->setVisible(ZZ)Z

    invoke-direct {p0, v0}, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat;->updateStateFromTypedArray(Landroid/content/res/TypedArray;)V

    invoke-virtual {p0, p2}, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat;->updateDensity(Landroid/content/res/Resources;)V

    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    invoke-direct/range {p0 .. p5}, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat;->inflateChildElements(Landroid/content/Context;Landroid/content/res/Resources;Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;Landroid/content/res/Resources$Theme;)V

    invoke-direct {p0}, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat;->init()V

    return-void
.end method

.method public bridge synthetic invalidateDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 2
    .param p1    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-super {p0, p1}, Landroid/support/v7/graphics/drawable/StateListDrawable;->invalidateDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public bridge synthetic isAutoMirrored()Z
    .registers 2

    invoke-super {p0}, Landroid/support/v7/graphics/drawable/StateListDrawable;->isAutoMirrored()Z

    move-result v0

    return v0
.end method

.method public isStateful()Z
    .registers 2

    const/4 v0, 0x1

    return v0
.end method

.method public jumpToCurrentState()V
    .registers 2

    invoke-super {p0}, Landroid/support/v7/graphics/drawable/StateListDrawable;->jumpToCurrentState()V

    iget-object v0, p0, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat;->mTransition:Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$Transition;

    if-eqz v0, :cond_19

    iget-object v0, p0, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat;->mTransition:Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$Transition;

    invoke-virtual {v0}, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$Transition;->stop()V

    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat;->mTransition:Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$Transition;

    iget v0, p0, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat;->mTransitionToIndex:I

    invoke-virtual {p0, v0}, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat;->selectDrawable(I)Z

    const/4 v0, -0x1

    iput v0, p0, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat;->mTransitionToIndex:I

    iput v0, p0, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat;->mTransitionFromIndex:I

    :cond_19
    return-void
.end method

.method public mutate()Landroid/graphics/drawable/Drawable;
    .registers 2

    iget-boolean v0, p0, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat;->mMutated:Z

    if-nez v0, :cond_12

    invoke-super {p0}, Landroid/support/v7/graphics/drawable/StateListDrawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-ne v0, p0, :cond_12

    iget-object v0, p0, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat;->mState:Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$AnimatedStateListState;

    invoke-virtual {v0}, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$AnimatedStateListState;->mutate()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat;->mMutated:Z

    :cond_12
    return-object p0
.end method

.method public bridge synthetic onLayoutDirectionChanged(I)Z
    .registers 2

    invoke-super {p0, p1}, Landroid/support/v7/graphics/drawable/StateListDrawable;->onLayoutDirectionChanged(I)Z

    move-result p1

    return p1
.end method

.method protected onStateChange([I)Z
    .registers 4

    iget-object v0, p0, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat;->mState:Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$AnimatedStateListState;

    invoke-virtual {v0, p1}, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$AnimatedStateListState;->indexOfKeyframe([I)I

    move-result v0

    invoke-virtual {p0}, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat;->getCurrentIndex()I

    move-result v1

    if-eq v0, v1, :cond_1a

    invoke-direct {p0, v0}, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat;->selectTransition(I)Z

    move-result v1

    if-nez v1, :cond_18

    invoke-virtual {p0, v0}, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat;->selectDrawable(I)Z

    move-result v0

    if-eqz v0, :cond_1a

    :cond_18
    const/4 v0, 0x1

    goto :goto_1b

    :cond_1a
    const/4 v0, 0x0

    :goto_1b
    invoke-virtual {p0}, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat;->getCurrent()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    if-eqz v1, :cond_26

    invoke-virtual {v1, p1}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    move-result p1

    or-int/2addr v0, p1

    :cond_26
    return v0
.end method

.method public bridge synthetic scheduleDrawable(Landroid/graphics/drawable/Drawable;Ljava/lang/Runnable;J)V
    .registers 5
    .param p1    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Runnable;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-super {p0, p1, p2, p3, p4}, Landroid/support/v7/graphics/drawable/StateListDrawable;->scheduleDrawable(Landroid/graphics/drawable/Drawable;Ljava/lang/Runnable;J)V

    return-void
.end method

.method public bridge synthetic setAlpha(I)V
    .registers 2

    invoke-super {p0, p1}, Landroid/support/v7/graphics/drawable/StateListDrawable;->setAlpha(I)V

    return-void
.end method

.method public bridge synthetic setAutoMirrored(Z)V
    .registers 2

    invoke-super {p0, p1}, Landroid/support/v7/graphics/drawable/StateListDrawable;->setAutoMirrored(Z)V

    return-void
.end method

.method public bridge synthetic setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 2

    invoke-super {p0, p1}, Landroid/support/v7/graphics/drawable/StateListDrawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    return-void
.end method

.method protected setConstantState(Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;)V
    .registers 3
    .param p1    # Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-super {p0, p1}, Landroid/support/v7/graphics/drawable/StateListDrawable;->setConstantState(Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;)V

    instance-of v0, p1, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$AnimatedStateListState;

    if-eqz v0, :cond_b

    check-cast p1, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$AnimatedStateListState;

    iput-object p1, p0, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat;->mState:Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$AnimatedStateListState;

    :cond_b
    return-void
.end method

.method public bridge synthetic setDither(Z)V
    .registers 2

    invoke-super {p0, p1}, Landroid/support/v7/graphics/drawable/StateListDrawable;->setDither(Z)V

    return-void
.end method

.method public bridge synthetic setEnterFadeDuration(I)V
    .registers 2

    invoke-super {p0, p1}, Landroid/support/v7/graphics/drawable/StateListDrawable;->setEnterFadeDuration(I)V

    return-void
.end method

.method public bridge synthetic setExitFadeDuration(I)V
    .registers 2

    invoke-super {p0, p1}, Landroid/support/v7/graphics/drawable/StateListDrawable;->setExitFadeDuration(I)V

    return-void
.end method

.method public bridge synthetic setHotspot(FF)V
    .registers 3

    invoke-super {p0, p1, p2}, Landroid/support/v7/graphics/drawable/StateListDrawable;->setHotspot(FF)V

    return-void
.end method

.method public bridge synthetic setHotspotBounds(IIII)V
    .registers 5

    invoke-super {p0, p1, p2, p3, p4}, Landroid/support/v7/graphics/drawable/StateListDrawable;->setHotspotBounds(IIII)V

    return-void
.end method

.method public bridge synthetic setTintList(Landroid/content/res/ColorStateList;)V
    .registers 2

    invoke-super {p0, p1}, Landroid/support/v7/graphics/drawable/StateListDrawable;->setTintList(Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method public bridge synthetic setTintMode(Landroid/graphics/PorterDuff$Mode;)V
    .registers 2
    .param p1    # Landroid/graphics/PorterDuff$Mode;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-super {p0, p1}, Landroid/support/v7/graphics/drawable/StateListDrawable;->setTintMode(Landroid/graphics/PorterDuff$Mode;)V

    return-void
.end method

.method public setVisible(ZZ)Z
    .registers 5

    invoke-super {p0, p1, p2}, Landroid/support/v7/graphics/drawable/StateListDrawable;->setVisible(ZZ)Z

    move-result v0

    iget-object v1, p0, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat;->mTransition:Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$Transition;

    if-eqz v1, :cond_17

    if-nez v0, :cond_c

    if-eqz p2, :cond_17

    :cond_c
    if-eqz p1, :cond_14

    iget-object p1, p0, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat;->mTransition:Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$Transition;

    invoke-virtual {p1}, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat$Transition;->start()V

    goto :goto_17

    :cond_14
    invoke-virtual {p0}, Landroid/support/v7/graphics/drawable/AnimatedStateListDrawableCompat;->jumpToCurrentState()V

    :cond_17
    :goto_17
    return v0
.end method

.method public bridge synthetic unscheduleDrawable(Landroid/graphics/drawable/Drawable;Ljava/lang/Runnable;)V
    .registers 3
    .param p1    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Runnable;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-super {p0, p1, p2}, Landroid/support/v7/graphics/drawable/StateListDrawable;->unscheduleDrawable(Landroid/graphics/drawable/Drawable;Ljava/lang/Runnable;)V

    return-void
.end method
