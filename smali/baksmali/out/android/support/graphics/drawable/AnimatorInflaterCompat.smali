.class public Landroid/support/graphics/drawable/AnimatorInflaterCompat;
.super Ljava/lang/Object;
.source "AnimatorInflaterCompat.java"


# annotations
.annotation build Landroid/support/annotation/RestrictTo;
    value = {
        .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
    }
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/graphics/drawable/AnimatorInflaterCompat$PathDataEvaluator;
    }
.end annotation


# static fields
.field private static final DBG_ANIMATOR_INFLATER:Z = false

.field private static final MAX_NUM_POINTS:I = 0x64

.field private static final TAG:Ljava/lang/String; = "AnimatorInflater"

.field private static final TOGETHER:I = 0x0

.field private static final VALUE_TYPE_COLOR:I = 0x3

.field private static final VALUE_TYPE_FLOAT:I = 0x0

.field private static final VALUE_TYPE_INT:I = 0x1

.field private static final VALUE_TYPE_PATH:I = 0x2

.field private static final VALUE_TYPE_UNDEFINED:I = 0x4


# direct methods
.method private constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static createAnimatorFromXml(Landroid/content/Context;Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Lorg/xmlpull/v1/XmlPullParser;F)Landroid/animation/Animator;
    .registers 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    invoke-static {p3}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    move-result-object v4

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v7, p4

    invoke-static/range {v0 .. v7}, Landroid/support/graphics/drawable/AnimatorInflaterCompat;->createAnimatorFromXml(Landroid/content/Context;Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;Landroid/animation/AnimatorSet;IF)Landroid/animation/Animator;

    move-result-object p0

    return-object p0
.end method

.method private static createAnimatorFromXml(Landroid/content/Context;Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;Landroid/animation/AnimatorSet;IF)Landroid/animation/Animator;
    .registers 26
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    move-object/from16 v8, p1

    move-object/from16 v9, p2

    move-object/from16 v10, p3

    move-object/from16 v11, p5

    invoke-interface/range {p3 .. p3}, Lorg/xmlpull/v1/XmlPullParser;->getDepth()I

    move-result v12

    const/4 v0, 0x0

    move-object v13, v0

    :cond_e
    :goto_e
    invoke-interface/range {p3 .. p3}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v1

    const/4 v2, 0x3

    const/4 v14, 0x0

    if-ne v1, v2, :cond_1c

    invoke-interface/range {p3 .. p3}, Lorg/xmlpull/v1/XmlPullParser;->getDepth()I

    move-result v2

    if-le v2, v12, :cond_e1

    :cond_1c
    const/4 v2, 0x1

    if-eq v1, v2, :cond_e1

    const/4 v3, 0x2

    if-eq v1, v3, :cond_23

    goto :goto_e

    :cond_23
    invoke-interface/range {p3 .. p3}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v3, "objectAnimator"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_43

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p4

    move/from16 v4, p7

    move-object/from16 v5, p3

    invoke-static/range {v0 .. v5}, Landroid/support/graphics/drawable/AnimatorInflaterCompat;->loadObjectAnimator(Landroid/content/Context;Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Landroid/util/AttributeSet;FLorg/xmlpull/v1/XmlPullParser;)Landroid/animation/ObjectAnimator;

    move-result-object v0

    :goto_3f
    move-object/from16 v3, p0

    goto/16 :goto_b6

    :cond_43
    const-string v3, "animator"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5d

    const/4 v4, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p4

    move/from16 v5, p7

    move-object/from16 v6, p3

    invoke-static/range {v0 .. v6}, Landroid/support/graphics/drawable/AnimatorInflaterCompat;->loadAnimator(Landroid/content/Context;Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Landroid/util/AttributeSet;Landroid/animation/ValueAnimator;FLorg/xmlpull/v1/XmlPullParser;)Landroid/animation/ValueAnimator;

    move-result-object v0

    goto :goto_3f

    :cond_5d
    const-string v3, "set"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_95

    new-instance v15, Landroid/animation/AnimatorSet;

    invoke-direct {v15}, Landroid/animation/AnimatorSet;-><init>()V

    sget-object v0, Landroid/support/graphics/drawable/AndroidResources;->STYLEABLE_ANIMATOR_SET:[I

    move-object/from16 v7, p4

    invoke-static {v8, v9, v7, v0}, Landroid/support/v4/content/res/TypedArrayUtils;->obtainAttributes(Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v6

    const-string v0, "ordering"

    invoke-static {v6, v10, v0, v14, v14}, Landroid/support/v4/content/res/TypedArrayUtils;->getNamedInt(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;II)I

    move-result v16

    move-object v5, v15

    check-cast v5, Landroid/animation/AnimatorSet;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    move-object/from16 v4, p4

    move-object/from16 v17, v6

    move/from16 v6, v16

    move/from16 v7, p7

    invoke-static/range {v0 .. v7}, Landroid/support/graphics/drawable/AnimatorInflaterCompat;->createAnimatorFromXml(Landroid/content/Context;Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;Landroid/animation/AnimatorSet;IF)Landroid/animation/Animator;

    invoke-virtual/range {v17 .. v17}, Landroid/content/res/TypedArray;->recycle()V

    move-object/from16 v3, p0

    move-object v0, v15

    goto :goto_b6

    :cond_95
    const-string v3, "propertyValuesHolder"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_c6

    invoke-static/range {p3 .. p3}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    move-result-object v1

    move-object/from16 v3, p0

    invoke-static {v3, v8, v9, v10, v1}, Landroid/support/graphics/drawable/AnimatorInflaterCompat;->loadValues(Landroid/content/Context;Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;)[Landroid/animation/PropertyValuesHolder;

    move-result-object v1

    if-eqz v1, :cond_b5

    if-eqz v0, :cond_b5

    instance-of v4, v0, Landroid/animation/ValueAnimator;

    if-eqz v4, :cond_b5

    move-object v4, v0

    check-cast v4, Landroid/animation/ValueAnimator;

    invoke-virtual {v4, v1}, Landroid/animation/ValueAnimator;->setValues([Landroid/animation/PropertyValuesHolder;)V

    :cond_b5
    const/4 v14, 0x1

    :goto_b6
    if-eqz v11, :cond_e

    if-nez v14, :cond_e

    if-nez v13, :cond_c1

    new-instance v13, Ljava/util/ArrayList;

    invoke-direct {v13}, Ljava/util/ArrayList;-><init>()V

    :cond_c1
    invoke-virtual {v13, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_e

    :cond_c6
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown animator name: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface/range {p3 .. p3}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_e1
    if-eqz v11, :cond_10a

    if-eqz v13, :cond_10a

    invoke-virtual {v13}, Ljava/util/ArrayList;->size()I

    move-result v1

    new-array v1, v1, [Landroid/animation/Animator;

    invoke-virtual {v13}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_ef
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_101

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/animation/Animator;

    add-int/lit8 v4, v14, 0x1

    aput-object v3, v1, v14

    move v14, v4

    goto :goto_ef

    :cond_101
    if-nez p6, :cond_107

    invoke-virtual {v11, v1}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    goto :goto_10a

    :cond_107
    invoke-virtual {v11, v1}, Landroid/animation/AnimatorSet;->playSequentially([Landroid/animation/Animator;)V

    :cond_10a
    :goto_10a
    return-object v0
.end method

.method private static createNewKeyframe(Landroid/animation/Keyframe;F)Landroid/animation/Keyframe;
    .registers 4

    invoke-virtual {p0}, Landroid/animation/Keyframe;->getType()Ljava/lang/Class;

    move-result-object v0

    sget-object v1, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    if-ne v0, v1, :cond_d

    invoke-static {p1}, Landroid/animation/Keyframe;->ofFloat(F)Landroid/animation/Keyframe;

    move-result-object p0

    goto :goto_1e

    :cond_d
    invoke-virtual {p0}, Landroid/animation/Keyframe;->getType()Ljava/lang/Class;

    move-result-object p0

    sget-object v0, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    if-ne p0, v0, :cond_1a

    invoke-static {p1}, Landroid/animation/Keyframe;->ofInt(F)Landroid/animation/Keyframe;

    move-result-object p0

    goto :goto_1e

    :cond_1a
    invoke-static {p1}, Landroid/animation/Keyframe;->ofObject(F)Landroid/animation/Keyframe;

    move-result-object p0

    :goto_1e
    return-object p0
.end method

.method private static distributeKeyframes([Landroid/animation/Keyframe;FII)V
    .registers 6

    sub-int v0, p3, p2

    add-int/lit8 v0, v0, 0x2

    int-to-float v0, v0

    div-float/2addr p1, v0

    :goto_6
    if-gt p2, p3, :cond_19

    aget-object v0, p0, p2

    add-int/lit8 v1, p2, -0x1

    aget-object v1, p0, v1

    invoke-virtual {v1}, Landroid/animation/Keyframe;->getFraction()F

    move-result v1

    add-float/2addr v1, p1

    invoke-virtual {v0, v1}, Landroid/animation/Keyframe;->setFraction(F)V

    add-int/lit8 p2, p2, 0x1

    goto :goto_6

    :cond_19
    return-void
.end method

.method private static dumpKeyframes([Ljava/lang/Object;Ljava/lang/String;)V
    .registers 8

    if-eqz p0, :cond_63

    array-length v0, p0

    if-nez v0, :cond_6

    goto :goto_63

    :cond_6
    const-string v0, "AnimatorInflater"

    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    array-length p1, p0

    const/4 v0, 0x0

    :goto_d
    if-ge v0, p1, :cond_62

    aget-object v1, p0, v0

    check-cast v1, Landroid/animation/Keyframe;

    const-string v2, "AnimatorInflater"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Keyframe "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, ": fraction "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Landroid/animation/Keyframe;->getFraction()F

    move-result v4

    const/4 v5, 0x0

    cmpg-float v4, v4, v5

    if-gez v4, :cond_33

    const-string v4, "null"

    goto :goto_3b

    :cond_33
    invoke-virtual {v1}, Landroid/animation/Keyframe;->getFraction()F

    move-result v4

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    :goto_3b
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v4, ", "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, ", value : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Landroid/animation/Keyframe;->hasValue()Z

    move-result v4

    if-eqz v4, :cond_53

    invoke-virtual {v1}, Landroid/animation/Keyframe;->getValue()Ljava/lang/Object;

    move-result-object v1

    goto :goto_55

    :cond_53
    const-string v1, "null"

    :goto_55
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    add-int/lit8 v0, v0, 0x1

    goto :goto_d

    :cond_62
    return-void

    :cond_63
    :goto_63
    return-void
.end method

.method private static getPVH(Landroid/content/res/TypedArray;IIILjava/lang/String;)Landroid/animation/PropertyValuesHolder;
    .registers 16

    invoke-virtual {p0, p2}, Landroid/content/res/TypedArray;->peekValue(I)Landroid/util/TypedValue;

    move-result-object v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_a

    const/4 v3, 0x1

    goto :goto_b

    :cond_a
    const/4 v3, 0x0

    :goto_b
    if-eqz v3, :cond_10

    iget v0, v0, Landroid/util/TypedValue;->type:I

    goto :goto_11

    :cond_10
    const/4 v0, 0x0

    :goto_11
    invoke-virtual {p0, p3}, Landroid/content/res/TypedArray;->peekValue(I)Landroid/util/TypedValue;

    move-result-object v4

    if-eqz v4, :cond_19

    const/4 v5, 0x1

    goto :goto_1a

    :cond_19
    const/4 v5, 0x0

    :goto_1a
    if-eqz v5, :cond_1f

    iget v4, v4, Landroid/util/TypedValue;->type:I

    goto :goto_20

    :cond_1f
    const/4 v4, 0x0

    :goto_20
    const/4 v6, 0x4

    const/4 v7, 0x3

    if-ne p1, v6, :cond_37

    if-eqz v3, :cond_2c

    invoke-static {v0}, Landroid/support/graphics/drawable/AnimatorInflaterCompat;->isColorType(I)Z

    move-result p1

    if-nez p1, :cond_34

    :cond_2c
    if-eqz v5, :cond_36

    invoke-static {v4}, Landroid/support/graphics/drawable/AnimatorInflaterCompat;->isColorType(I)Z

    move-result p1

    if-eqz p1, :cond_36

    :cond_34
    const/4 p1, 0x3

    goto :goto_37

    :cond_36
    const/4 p1, 0x0

    :cond_37
    :goto_37
    if-nez p1, :cond_3b

    const/4 v6, 0x1

    goto :goto_3c

    :cond_3b
    const/4 v6, 0x0

    :goto_3c
    const/4 v8, 0x0

    const/4 v9, 0x2

    if-ne p1, v9, :cond_a9

    invoke-virtual {p0, p2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p3}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object p0

    invoke-static {p1}, Landroid/support/v4/graphics/PathParser;->createNodesFromPathData(Ljava/lang/String;)[Landroid/support/v4/graphics/PathParser$PathDataNode;

    move-result-object p2

    invoke-static {p0}, Landroid/support/v4/graphics/PathParser;->createNodesFromPathData(Ljava/lang/String;)[Landroid/support/v4/graphics/PathParser$PathDataNode;

    move-result-object p3

    if-nez p2, :cond_54

    if-eqz p3, :cond_167

    :cond_54
    if-eqz p2, :cond_98

    new-instance v0, Landroid/support/graphics/drawable/AnimatorInflaterCompat$PathDataEvaluator;

    invoke-direct {v0}, Landroid/support/graphics/drawable/AnimatorInflaterCompat$PathDataEvaluator;-><init>()V

    if-eqz p3, :cond_8d

    invoke-static {p2, p3}, Landroid/support/v4/graphics/PathParser;->canMorph([Landroid/support/v4/graphics/PathParser$PathDataNode;[Landroid/support/v4/graphics/PathParser$PathDataNode;)Z

    move-result v3

    if-eqz v3, :cond_6e

    new-array p0, v9, [Ljava/lang/Object;

    aput-object p2, p0, v2

    aput-object p3, p0, v1

    invoke-static {p4, v0, p0}, Landroid/animation/PropertyValuesHolder;->ofObject(Ljava/lang/String;Landroid/animation/TypeEvaluator;[Ljava/lang/Object;)Landroid/animation/PropertyValuesHolder;

    move-result-object p0

    goto :goto_95

    :cond_6e
    new-instance p2, Landroid/view/InflateException;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string p4, " Can\'t morph from "

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " to "

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p2, p0}, Landroid/view/InflateException;-><init>(Ljava/lang/String;)V

    throw p2

    :cond_8d
    new-array p0, v1, [Ljava/lang/Object;

    aput-object p2, p0, v2

    invoke-static {p4, v0, p0}, Landroid/animation/PropertyValuesHolder;->ofObject(Ljava/lang/String;Landroid/animation/TypeEvaluator;[Ljava/lang/Object;)Landroid/animation/PropertyValuesHolder;

    move-result-object p0

    :goto_95
    move-object v8, p0

    goto/16 :goto_167

    :cond_98
    if-eqz p3, :cond_167

    new-instance p0, Landroid/support/graphics/drawable/AnimatorInflaterCompat$PathDataEvaluator;

    invoke-direct {p0}, Landroid/support/graphics/drawable/AnimatorInflaterCompat$PathDataEvaluator;-><init>()V

    new-array p1, v1, [Ljava/lang/Object;

    aput-object p3, p1, v2

    invoke-static {p4, p0, p1}, Landroid/animation/PropertyValuesHolder;->ofObject(Ljava/lang/String;Landroid/animation/TypeEvaluator;[Ljava/lang/Object;)Landroid/animation/PropertyValuesHolder;

    move-result-object v8

    goto/16 :goto_167

    :cond_a9
    if-ne p1, v7, :cond_b0

    invoke-static {}, Landroid/support/graphics/drawable/ArgbEvaluator;->getInstance()Landroid/support/graphics/drawable/ArgbEvaluator;

    move-result-object p1

    goto :goto_b1

    :cond_b0
    move-object p1, v8

    :goto_b1
    const/4 v7, 0x5

    const/4 v10, 0x0

    if-eqz v6, :cond_f9

    if-eqz v3, :cond_e3

    if-ne v0, v7, :cond_be

    invoke-virtual {p0, p2, v10}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result p2

    goto :goto_c2

    :cond_be
    invoke-virtual {p0, p2, v10}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result p2

    :goto_c2
    if-eqz v5, :cond_da

    if-ne v4, v7, :cond_cb

    invoke-virtual {p0, p3, v10}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result p0

    goto :goto_cf

    :cond_cb
    invoke-virtual {p0, p3, v10}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result p0

    :goto_cf
    new-array p3, v9, [F

    aput p2, p3, v2

    aput p0, p3, v1

    invoke-static {p4, p3}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object p0

    goto :goto_f6

    :cond_da
    new-array p0, v1, [F

    aput p2, p0, v2

    invoke-static {p4, p0}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object p0

    goto :goto_f6

    :cond_e3
    if-ne v4, v7, :cond_ea

    invoke-virtual {p0, p3, v10}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result p0

    goto :goto_ee

    :cond_ea
    invoke-virtual {p0, p3, v10}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result p0

    :goto_ee
    new-array p2, v1, [F

    aput p0, p2, v2

    invoke-static {p4, p2}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object p0

    :goto_f6
    move-object v8, p0

    goto/16 :goto_160

    :cond_f9
    if-eqz v3, :cond_13f

    if-ne v0, v7, :cond_103

    invoke-virtual {p0, p2, v10}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result p2

    float-to-int p2, p2

    goto :goto_112

    :cond_103
    invoke-static {v0}, Landroid/support/graphics/drawable/AnimatorInflaterCompat;->isColorType(I)Z

    move-result v0

    if-eqz v0, :cond_10e

    invoke-virtual {p0, p2, v2}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p2

    goto :goto_112

    :cond_10e
    invoke-virtual {p0, p2, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result p2

    :goto_112
    if-eqz v5, :cond_136

    if-ne v4, v7, :cond_11c

    invoke-virtual {p0, p3, v10}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result p0

    float-to-int p0, p0

    goto :goto_12b

    :cond_11c
    invoke-static {v4}, Landroid/support/graphics/drawable/AnimatorInflaterCompat;->isColorType(I)Z

    move-result v0

    if-eqz v0, :cond_127

    invoke-virtual {p0, p3, v2}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p0

    goto :goto_12b

    :cond_127
    invoke-virtual {p0, p3, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result p0

    :goto_12b
    new-array p3, v9, [I

    aput p2, p3, v2

    aput p0, p3, v1

    invoke-static {p4, p3}, Landroid/animation/PropertyValuesHolder;->ofInt(Ljava/lang/String;[I)Landroid/animation/PropertyValuesHolder;

    move-result-object v8

    goto :goto_160

    :cond_136
    new-array p0, v1, [I

    aput p2, p0, v2

    invoke-static {p4, p0}, Landroid/animation/PropertyValuesHolder;->ofInt(Ljava/lang/String;[I)Landroid/animation/PropertyValuesHolder;

    move-result-object v8

    goto :goto_160

    :cond_13f
    if-eqz v5, :cond_160

    if-ne v4, v7, :cond_149

    invoke-virtual {p0, p3, v10}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result p0

    float-to-int p0, p0

    goto :goto_158

    :cond_149
    invoke-static {v4}, Landroid/support/graphics/drawable/AnimatorInflaterCompat;->isColorType(I)Z

    move-result p2

    if-eqz p2, :cond_154

    invoke-virtual {p0, p3, v2}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p0

    goto :goto_158

    :cond_154
    invoke-virtual {p0, p3, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result p0

    :goto_158
    new-array p2, v1, [I

    aput p0, p2, v2

    invoke-static {p4, p2}, Landroid/animation/PropertyValuesHolder;->ofInt(Ljava/lang/String;[I)Landroid/animation/PropertyValuesHolder;

    move-result-object v8

    :cond_160
    :goto_160
    if-eqz v8, :cond_167

    if-eqz p1, :cond_167

    invoke-virtual {v8, p1}, Landroid/animation/PropertyValuesHolder;->setEvaluator(Landroid/animation/TypeEvaluator;)V

    :cond_167
    :goto_167
    return-object v8
.end method

.method private static inferValueTypeFromValues(Landroid/content/res/TypedArray;II)I
    .registers 6

    invoke-virtual {p0, p1}, Landroid/content/res/TypedArray;->peekValue(I)Landroid/util/TypedValue;

    move-result-object p1

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-eqz p1, :cond_a

    const/4 v2, 0x1

    goto :goto_b

    :cond_a
    const/4 v2, 0x0

    :goto_b
    if-eqz v2, :cond_10

    iget p1, p1, Landroid/util/TypedValue;->type:I

    goto :goto_11

    :cond_10
    const/4 p1, 0x0

    :goto_11
    invoke-virtual {p0, p2}, Landroid/content/res/TypedArray;->peekValue(I)Landroid/util/TypedValue;

    move-result-object p0

    if-eqz p0, :cond_18

    goto :goto_19

    :cond_18
    const/4 v0, 0x0

    :goto_19
    if-eqz v0, :cond_1e

    iget p0, p0, Landroid/util/TypedValue;->type:I

    goto :goto_1f

    :cond_1e
    const/4 p0, 0x0

    :goto_1f
    if-eqz v2, :cond_27

    invoke-static {p1}, Landroid/support/graphics/drawable/AnimatorInflaterCompat;->isColorType(I)Z

    move-result p1

    if-nez p1, :cond_2f

    :cond_27
    if-eqz v0, :cond_30

    invoke-static {p0}, Landroid/support/graphics/drawable/AnimatorInflaterCompat;->isColorType(I)Z

    move-result p0

    if-eqz p0, :cond_30

    :cond_2f
    const/4 v1, 0x3

    :cond_30
    return v1
.end method

.method private static inferValueTypeOfKeyframe(Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Landroid/util/AttributeSet;Lorg/xmlpull/v1/XmlPullParser;)I
    .registers 5

    sget-object v0, Landroid/support/graphics/drawable/AndroidResources;->STYLEABLE_KEYFRAME:[I

    invoke-static {p0, p1, p2, v0}, Landroid/support/v4/content/res/TypedArrayUtils;->obtainAttributes(Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p0

    const-string p1, "value"

    const/4 p2, 0x0

    invoke-static {p0, p3, p1, p2}, Landroid/support/v4/content/res/TypedArrayUtils;->peekNamedValue(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;I)Landroid/util/TypedValue;

    move-result-object p1

    if-eqz p1, :cond_11

    const/4 p3, 0x1

    goto :goto_12

    :cond_11
    const/4 p3, 0x0

    :goto_12
    if-eqz p3, :cond_1d

    iget p1, p1, Landroid/util/TypedValue;->type:I

    invoke-static {p1}, Landroid/support/graphics/drawable/AnimatorInflaterCompat;->isColorType(I)Z

    move-result p1

    if-eqz p1, :cond_1d

    const/4 p2, 0x3

    :cond_1d
    invoke-virtual {p0}, Landroid/content/res/TypedArray;->recycle()V

    return p2
.end method

.method private static isColorType(I)Z
    .registers 2

    const/16 v0, 0x1c

    if-lt p0, v0, :cond_a

    const/16 v0, 0x1f

    if-gt p0, v0, :cond_a

    const/4 p0, 0x1

    goto :goto_b

    :cond_a
    const/4 p0, 0x0

    :goto_b
    return p0
.end method

.method public static loadAnimator(Landroid/content/Context;I)Landroid/animation/Animator;
    .registers 4
    .param p1    # I
        .annotation build Landroid/support/annotation/AnimatorRes;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/res/Resources$NotFoundException;
        }
    .end annotation

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x18

    if-lt v0, v1, :cond_b

    invoke-static {p0, p1}, Landroid/animation/AnimatorInflater;->loadAnimator(Landroid/content/Context;I)Landroid/animation/Animator;

    move-result-object p0

    goto :goto_17

    :cond_b
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    invoke-static {p0, v0, v1, p1}, Landroid/support/graphics/drawable/AnimatorInflaterCompat;->loadAnimator(Landroid/content/Context;Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;I)Landroid/animation/Animator;

    move-result-object p0

    :goto_17
    return-object p0
.end method

.method public static loadAnimator(Landroid/content/Context;Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;I)Landroid/animation/Animator;
    .registers 5
    .param p3    # I
        .annotation build Landroid/support/annotation/AnimatorRes;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/res/Resources$NotFoundException;
        }
    .end annotation

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-static {p0, p1, p2, p3, v0}, Landroid/support/graphics/drawable/AnimatorInflaterCompat;->loadAnimator(Landroid/content/Context;Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;IF)Landroid/animation/Animator;

    move-result-object p0

    return-object p0
.end method

.method public static loadAnimator(Landroid/content/Context;Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;IF)Landroid/animation/Animator;
    .registers 7
    .param p3    # I
        .annotation build Landroid/support/annotation/AnimatorRes;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/res/Resources$NotFoundException;
        }
    .end annotation

    const/4 v0, 0x0

    :try_start_1
    invoke-virtual {p1, p3}, Landroid/content/res/Resources;->getAnimation(I)Landroid/content/res/XmlResourceParser;

    move-result-object v1
    :try_end_5
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_1 .. :try_end_5} :catch_39
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_5} :catch_1a
    .catchall {:try_start_1 .. :try_end_5} :catchall_18

    :try_start_5
    invoke-static {p0, p1, p2, v1, p4}, Landroid/support/graphics/drawable/AnimatorInflaterCompat;->createAnimatorFromXml(Landroid/content/Context;Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Lorg/xmlpull/v1/XmlPullParser;F)Landroid/animation/Animator;

    move-result-object p0
    :try_end_9
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_5 .. :try_end_9} :catch_15
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_9} :catch_12
    .catchall {:try_start_5 .. :try_end_9} :catchall_f

    if-eqz v1, :cond_e

    invoke-interface {v1}, Landroid/content/res/XmlResourceParser;->close()V

    :cond_e
    return-object p0

    :catchall_f
    move-exception p0

    move-object v0, v1

    goto :goto_58

    :catch_12
    move-exception p0

    move-object v0, v1

    goto :goto_1b

    :catch_15
    move-exception p0

    move-object v0, v1

    goto :goto_3a

    :catchall_18
    move-exception p0

    goto :goto_58

    :catch_1a
    move-exception p0

    :goto_1b
    :try_start_1b
    new-instance p1, Landroid/content/res/Resources$NotFoundException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p4, "Can\'t load animation resource ID #0x"

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p3}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Landroid/content/res/Resources$NotFoundException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p0}, Landroid/content/res/Resources$NotFoundException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    throw p1

    :catch_39
    move-exception p0

    :goto_3a
    new-instance p1, Landroid/content/res/Resources$NotFoundException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p4, "Can\'t load animation resource ID #0x"

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p3}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Landroid/content/res/Resources$NotFoundException;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p0}, Landroid/content/res/Resources$NotFoundException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    throw p1
    :try_end_58
    .catchall {:try_start_1b .. :try_end_58} :catchall_18

    :goto_58
    if-eqz v0, :cond_5d

    invoke-interface {v0}, Landroid/content/res/XmlResourceParser;->close()V

    :cond_5d
    throw p0
.end method

.method private static loadAnimator(Landroid/content/Context;Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Landroid/util/AttributeSet;Landroid/animation/ValueAnimator;FLorg/xmlpull/v1/XmlPullParser;)Landroid/animation/ValueAnimator;
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/res/Resources$NotFoundException;
        }
    .end annotation

    sget-object v0, Landroid/support/graphics/drawable/AndroidResources;->STYLEABLE_ANIMATOR:[I

    invoke-static {p1, p2, p3, v0}, Landroid/support/v4/content/res/TypedArrayUtils;->obtainAttributes(Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v0

    sget-object v1, Landroid/support/graphics/drawable/AndroidResources;->STYLEABLE_PROPERTY_ANIMATOR:[I

    invoke-static {p1, p2, p3, v1}, Landroid/support/v4/content/res/TypedArrayUtils;->obtainAttributes(Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p1

    if-nez p4, :cond_13

    new-instance p4, Landroid/animation/ValueAnimator;

    invoke-direct {p4}, Landroid/animation/ValueAnimator;-><init>()V

    :cond_13
    invoke-static {p4, v0, p1, p5, p6}, Landroid/support/graphics/drawable/AnimatorInflaterCompat;->parseAnimatorFromTypeArray(Landroid/animation/ValueAnimator;Landroid/content/res/TypedArray;Landroid/content/res/TypedArray;FLorg/xmlpull/v1/XmlPullParser;)V

    const-string p2, "interpolator"

    const/4 p3, 0x0

    invoke-static {v0, p6, p2, p3, p3}, Landroid/support/v4/content/res/TypedArrayUtils;->getNamedResourceId(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;II)I

    move-result p2

    if-lez p2, :cond_26

    invoke-static {p0, p2}, Landroid/support/graphics/drawable/AnimationUtilsCompat;->loadInterpolator(Landroid/content/Context;I)Landroid/view/animation/Interpolator;

    move-result-object p0

    invoke-virtual {p4, p0}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    :cond_26
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    if-eqz p1, :cond_2e

    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    :cond_2e
    return-object p4
.end method

.method private static loadKeyframe(Landroid/content/Context;Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Landroid/util/AttributeSet;ILorg/xmlpull/v1/XmlPullParser;)Landroid/animation/Keyframe;
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Landroid/support/graphics/drawable/AndroidResources;->STYLEABLE_KEYFRAME:[I

    invoke-static {p1, p2, p3, v0}, Landroid/support/v4/content/res/TypedArrayUtils;->obtainAttributes(Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p1

    const-string p2, "fraction"

    const/4 p3, 0x3

    const/high16 v0, -0x40800000    # -1.0f

    invoke-static {p1, p5, p2, p3, v0}, Landroid/support/v4/content/res/TypedArrayUtils;->getNamedFloat(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;IF)F

    move-result p2

    const-string v0, "value"

    const/4 v1, 0x0

    invoke-static {p1, p5, v0, v1}, Landroid/support/v4/content/res/TypedArrayUtils;->peekNamedValue(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;I)Landroid/util/TypedValue;

    move-result-object v0

    const/4 v2, 0x1

    if-eqz v0, :cond_1b

    const/4 v3, 0x1

    goto :goto_1c

    :cond_1b
    const/4 v3, 0x0

    :goto_1c
    const/4 v4, 0x4

    if-ne p4, v4, :cond_2c

    if-eqz v3, :cond_2b

    iget p4, v0, Landroid/util/TypedValue;->type:I

    invoke-static {p4}, Landroid/support/graphics/drawable/AnimatorInflaterCompat;->isColorType(I)Z

    move-result p4

    if-eqz p4, :cond_2b

    const/4 p4, 0x3

    goto :goto_2c

    :cond_2b
    const/4 p4, 0x0

    :cond_2c
    :goto_2c
    if-eqz v3, :cond_4c

    if-eq p4, p3, :cond_41

    packed-switch p4, :pswitch_data_6a

    const/4 p2, 0x0

    goto :goto_57

    :pswitch_35
    const-string p3, "value"

    const/4 p4, 0x0

    invoke-static {p1, p5, p3, v1, p4}, Landroid/support/v4/content/res/TypedArrayUtils;->getNamedFloat(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;IF)F

    move-result p3

    invoke-static {p2, p3}, Landroid/animation/Keyframe;->ofFloat(FF)Landroid/animation/Keyframe;

    move-result-object p2

    goto :goto_57

    :cond_41
    :pswitch_41
    const-string p3, "value"

    invoke-static {p1, p5, p3, v1, v1}, Landroid/support/v4/content/res/TypedArrayUtils;->getNamedInt(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;II)I

    move-result p3

    invoke-static {p2, p3}, Landroid/animation/Keyframe;->ofInt(FI)Landroid/animation/Keyframe;

    move-result-object p2

    goto :goto_57

    :cond_4c
    if-nez p4, :cond_53

    invoke-static {p2}, Landroid/animation/Keyframe;->ofFloat(F)Landroid/animation/Keyframe;

    move-result-object p2

    goto :goto_57

    :cond_53
    invoke-static {p2}, Landroid/animation/Keyframe;->ofInt(F)Landroid/animation/Keyframe;

    move-result-object p2

    :goto_57
    const-string p3, "interpolator"

    invoke-static {p1, p5, p3, v2, v1}, Landroid/support/v4/content/res/TypedArrayUtils;->getNamedResourceId(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;II)I

    move-result p3

    if-lez p3, :cond_66

    invoke-static {p0, p3}, Landroid/support/graphics/drawable/AnimationUtilsCompat;->loadInterpolator(Landroid/content/Context;I)Landroid/view/animation/Interpolator;

    move-result-object p0

    invoke-virtual {p2, p0}, Landroid/animation/Keyframe;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    :cond_66
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    return-object p2

    :pswitch_data_6a
    .packed-switch 0x0
        :pswitch_35
        :pswitch_41
    .end packed-switch
.end method

.method private static loadObjectAnimator(Landroid/content/Context;Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Landroid/util/AttributeSet;FLorg/xmlpull/v1/XmlPullParser;)Landroid/animation/ObjectAnimator;
    .registers 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/res/Resources$NotFoundException;
        }
    .end annotation

    new-instance v7, Landroid/animation/ObjectAnimator;

    invoke-direct {v7}, Landroid/animation/ObjectAnimator;-><init>()V

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, v7

    move v5, p4

    move-object v6, p5

    invoke-static/range {v0 .. v6}, Landroid/support/graphics/drawable/AnimatorInflaterCompat;->loadAnimator(Landroid/content/Context;Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Landroid/util/AttributeSet;Landroid/animation/ValueAnimator;FLorg/xmlpull/v1/XmlPullParser;)Landroid/animation/ValueAnimator;

    return-object v7
.end method

.method private static loadPvh(Landroid/content/Context;Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;I)Landroid/animation/PropertyValuesHolder;
    .registers 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    move v1, p5

    move-object p5, v0

    :cond_3
    :goto_3
    invoke-interface {p3}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    move-result v2

    const/4 v3, 0x3

    if-eq v2, v3, :cond_41

    const/4 v4, 0x1

    if-eq v2, v4, :cond_41

    invoke-interface {p3}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "keyframe"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    const/4 v2, 0x4

    if-ne v1, v2, :cond_24

    invoke-static {p3}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    move-result-object v1

    invoke-static {p1, p2, v1, p3}, Landroid/support/graphics/drawable/AnimatorInflaterCompat;->inferValueTypeOfKeyframe(Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Landroid/util/AttributeSet;Lorg/xmlpull/v1/XmlPullParser;)I

    move-result v1

    :cond_24
    invoke-static {p3}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    move-result-object v5

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move v6, v1

    move-object v7, p3

    invoke-static/range {v2 .. v7}, Landroid/support/graphics/drawable/AnimatorInflaterCompat;->loadKeyframe(Landroid/content/Context;Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Landroid/util/AttributeSet;ILorg/xmlpull/v1/XmlPullParser;)Landroid/animation/Keyframe;

    move-result-object v2

    if-eqz v2, :cond_3d

    if-nez p5, :cond_3a

    new-instance p5, Ljava/util/ArrayList;

    invoke-direct {p5}, Ljava/util/ArrayList;-><init>()V

    :cond_3a
    invoke-virtual {p5, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_3d
    invoke-interface {p3}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    goto :goto_3

    :cond_41
    if-eqz p5, :cond_ea

    invoke-virtual {p5}, Ljava/util/ArrayList;->size()I

    move-result p0

    if-lez p0, :cond_ea

    const/4 p1, 0x0

    invoke-virtual {p5, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/animation/Keyframe;

    add-int/lit8 p3, p0, -0x1

    invoke-virtual {p5, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Landroid/animation/Keyframe;

    invoke-virtual {p3}, Landroid/animation/Keyframe;->getFraction()F

    move-result v0

    const/high16 v2, 0x3f800000    # 1.0f

    const/4 v4, 0x0

    cmpg-float v5, v0, v2

    if-gez v5, :cond_78

    cmpg-float v0, v0, v4

    if-gez v0, :cond_6b

    invoke-virtual {p3, v2}, Landroid/animation/Keyframe;->setFraction(F)V

    goto :goto_78

    :cond_6b
    invoke-virtual {p5}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-static {p3, v2}, Landroid/support/graphics/drawable/AnimatorInflaterCompat;->createNewKeyframe(Landroid/animation/Keyframe;F)Landroid/animation/Keyframe;

    move-result-object p3

    invoke-virtual {p5, v0, p3}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    add-int/lit8 p0, p0, 0x1

    :cond_78
    :goto_78
    invoke-virtual {p2}, Landroid/animation/Keyframe;->getFraction()F

    move-result p3

    cmpl-float v0, p3, v4

    if-eqz v0, :cond_91

    cmpg-float p3, p3, v4

    if-gez p3, :cond_88

    invoke-virtual {p2, v4}, Landroid/animation/Keyframe;->setFraction(F)V

    goto :goto_91

    :cond_88
    invoke-static {p2, v4}, Landroid/support/graphics/drawable/AnimatorInflaterCompat;->createNewKeyframe(Landroid/animation/Keyframe;F)Landroid/animation/Keyframe;

    move-result-object p2

    invoke-virtual {p5, p1, p2}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    add-int/lit8 p0, p0, 0x1

    :cond_91
    :goto_91
    new-array p2, p0, [Landroid/animation/Keyframe;

    invoke-virtual {p5, p2}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    :goto_96
    if-ge p1, p0, :cond_dd

    aget-object p3, p2, p1

    invoke-virtual {p3}, Landroid/animation/Keyframe;->getFraction()F

    move-result p5

    cmpg-float p5, p5, v4

    if-gez p5, :cond_da

    if-nez p1, :cond_a8

    invoke-virtual {p3, v4}, Landroid/animation/Keyframe;->setFraction(F)V

    goto :goto_da

    :cond_a8
    add-int/lit8 p5, p0, -0x1

    if-ne p1, p5, :cond_b0

    invoke-virtual {p3, v2}, Landroid/animation/Keyframe;->setFraction(F)V

    goto :goto_da

    :cond_b0
    add-int/lit8 p3, p1, 0x1

    move v0, p1

    :goto_b3
    if-ge p3, p5, :cond_c6

    aget-object v5, p2, p3

    invoke-virtual {v5}, Landroid/animation/Keyframe;->getFraction()F

    move-result v5

    cmpl-float v5, v5, v4

    if-ltz v5, :cond_c0

    goto :goto_c6

    :cond_c0
    add-int/lit8 v0, p3, 0x1

    move v8, v0

    move v0, p3

    move p3, v8

    goto :goto_b3

    :cond_c6
    :goto_c6
    add-int/lit8 p3, v0, 0x1

    aget-object p3, p2, p3

    invoke-virtual {p3}, Landroid/animation/Keyframe;->getFraction()F

    move-result p3

    add-int/lit8 p5, p1, -0x1

    aget-object p5, p2, p5

    invoke-virtual {p5}, Landroid/animation/Keyframe;->getFraction()F

    move-result p5

    sub-float/2addr p3, p5

    invoke-static {p2, p3, p1, v0}, Landroid/support/graphics/drawable/AnimatorInflaterCompat;->distributeKeyframes([Landroid/animation/Keyframe;FII)V

    :cond_da
    :goto_da
    add-int/lit8 p1, p1, 0x1

    goto :goto_96

    :cond_dd
    invoke-static {p4, p2}, Landroid/animation/PropertyValuesHolder;->ofKeyframe(Ljava/lang/String;[Landroid/animation/Keyframe;)Landroid/animation/PropertyValuesHolder;

    move-result-object v0

    if-ne v1, v3, :cond_ea

    invoke-static {}, Landroid/support/graphics/drawable/ArgbEvaluator;->getInstance()Landroid/support/graphics/drawable/ArgbEvaluator;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/animation/PropertyValuesHolder;->setEvaluator(Landroid/animation/TypeEvaluator;)V

    :cond_ea
    return-object v0
.end method

.method private static loadValues(Landroid/content/Context;Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Lorg/xmlpull/v1/XmlPullParser;Landroid/util/AttributeSet;)[Landroid/animation/PropertyValuesHolder;
    .registers 22
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/xmlpull/v1/XmlPullParserException;,
            Ljava/io/IOException;
        }
    .end annotation

    move-object/from16 v6, p3

    const/4 v7, 0x0

    move-object v8, v7

    :goto_4
    invoke-interface/range {p3 .. p3}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    move-result v0

    const/4 v9, 0x0

    const/4 v1, 0x3

    if-eq v0, v1, :cond_6c

    const/4 v10, 0x1

    if-eq v0, v10, :cond_6c

    const/4 v2, 0x2

    if-eq v0, v2, :cond_16

    invoke-interface/range {p3 .. p3}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    goto :goto_4

    :cond_16
    invoke-interface/range {p3 .. p3}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    move-result-object v0

    const-string v3, "propertyValuesHolder"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_62

    sget-object v0, Landroid/support/graphics/drawable/AndroidResources;->STYLEABLE_PROPERTY_VALUES_HOLDER:[I

    move-object/from16 v11, p1

    move-object/from16 v12, p2

    move-object/from16 v13, p4

    invoke-static {v11, v12, v13, v0}, Landroid/support/v4/content/res/TypedArrayUtils;->obtainAttributes(Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v14

    const-string v0, "propertyName"

    invoke-static {v14, v6, v0, v1}, Landroid/support/v4/content/res/TypedArrayUtils;->getNamedString(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v15

    const-string v0, "valueType"

    const/4 v1, 0x4

    invoke-static {v14, v6, v0, v2, v1}, Landroid/support/v4/content/res/TypedArrayUtils;->getNamedInt(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;II)I

    move-result v5

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    move-object v4, v15

    move/from16 v16, v5

    invoke-static/range {v0 .. v5}, Landroid/support/graphics/drawable/AnimatorInflaterCompat;->loadPvh(Landroid/content/Context;Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;I)Landroid/animation/PropertyValuesHolder;

    move-result-object v0

    if-nez v0, :cond_52

    move/from16 v1, v16

    invoke-static {v14, v1, v9, v10, v15}, Landroid/support/graphics/drawable/AnimatorInflaterCompat;->getPVH(Landroid/content/res/TypedArray;IIILjava/lang/String;)Landroid/animation/PropertyValuesHolder;

    move-result-object v0

    :cond_52
    if-eqz v0, :cond_5e

    if-nez v8, :cond_5b

    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    :cond_5b
    invoke-virtual {v8, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_5e
    invoke-virtual {v14}, Landroid/content/res/TypedArray;->recycle()V

    goto :goto_68

    :cond_62
    move-object/from16 v11, p1

    move-object/from16 v12, p2

    move-object/from16 v13, p4

    :goto_68
    invoke-interface/range {p3 .. p3}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    goto :goto_4

    :cond_6c
    if-eqz v8, :cond_81

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v0

    new-array v7, v0, [Landroid/animation/PropertyValuesHolder;

    :goto_74
    if-ge v9, v0, :cond_81

    invoke-virtual {v8, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/animation/PropertyValuesHolder;

    aput-object v1, v7, v9

    add-int/lit8 v9, v9, 0x1

    goto :goto_74

    :cond_81
    return-object v7
.end method

.method private static parseAnimatorFromTypeArray(Landroid/animation/ValueAnimator;Landroid/content/res/TypedArray;Landroid/content/res/TypedArray;FLorg/xmlpull/v1/XmlPullParser;)V
    .registers 16

    const-string v0, "duration"

    const/4 v1, 0x1

    const/16 v2, 0x12c

    invoke-static {p1, p4, v0, v1, v2}, Landroid/support/v4/content/res/TypedArrayUtils;->getNamedInt(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;II)I

    move-result v0

    int-to-long v2, v0

    const-string v0, "startOffset"

    const/4 v4, 0x0

    const/4 v5, 0x2

    invoke-static {p1, p4, v0, v5, v4}, Landroid/support/v4/content/res/TypedArrayUtils;->getNamedInt(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;II)I

    move-result v0

    int-to-long v5, v0

    const-string v0, "valueType"

    const/4 v7, 0x4

    const/4 v8, 0x7

    invoke-static {p1, p4, v0, v8, v7}, Landroid/support/v4/content/res/TypedArrayUtils;->getNamedInt(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;II)I

    move-result v0

    const-string v8, "valueFrom"

    invoke-static {p4, v8}, Landroid/support/v4/content/res/TypedArrayUtils;->hasAttribute(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_42

    const-string v8, "valueTo"

    invoke-static {p4, v8}, Landroid/support/v4/content/res/TypedArrayUtils;->hasAttribute(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_42

    const/4 v8, 0x6

    const/4 v9, 0x5

    if-ne v0, v7, :cond_33

    invoke-static {p1, v9, v8}, Landroid/support/graphics/drawable/AnimatorInflaterCompat;->inferValueTypeFromValues(Landroid/content/res/TypedArray;II)I

    move-result v0

    :cond_33
    const-string v10, ""

    invoke-static {p1, v0, v9, v8, v10}, Landroid/support/graphics/drawable/AnimatorInflaterCompat;->getPVH(Landroid/content/res/TypedArray;IIILjava/lang/String;)Landroid/animation/PropertyValuesHolder;

    move-result-object v8

    if-eqz v8, :cond_42

    new-array v9, v1, [Landroid/animation/PropertyValuesHolder;

    aput-object v8, v9, v4

    invoke-virtual {p0, v9}, Landroid/animation/ValueAnimator;->setValues([Landroid/animation/PropertyValuesHolder;)V

    :cond_42
    invoke-virtual {p0, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    invoke-virtual {p0, v5, v6}, Landroid/animation/ValueAnimator;->setStartDelay(J)V

    const-string v2, "repeatCount"

    const/4 v3, 0x3

    invoke-static {p1, p4, v2, v3, v4}, Landroid/support/v4/content/res/TypedArrayUtils;->getNamedInt(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;II)I

    move-result v2

    invoke-virtual {p0, v2}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    const-string v2, "repeatMode"

    invoke-static {p1, p4, v2, v7, v1}, Landroid/support/v4/content/res/TypedArrayUtils;->getNamedInt(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;II)I

    move-result p1

    invoke-virtual {p0, p1}, Landroid/animation/ValueAnimator;->setRepeatMode(I)V

    if-eqz p2, :cond_60

    invoke-static {p0, p2, v0, p3, p4}, Landroid/support/graphics/drawable/AnimatorInflaterCompat;->setupObjectAnimator(Landroid/animation/ValueAnimator;Landroid/content/res/TypedArray;IFLorg/xmlpull/v1/XmlPullParser;)V

    :cond_60
    return-void
.end method

.method private static setupObjectAnimator(Landroid/animation/ValueAnimator;Landroid/content/res/TypedArray;IFLorg/xmlpull/v1/XmlPullParser;)V
    .registers 10

    check-cast p0, Landroid/animation/ObjectAnimator;

    const-string v0, "pathData"

    const/4 v1, 0x1

    invoke-static {p1, p4, v0, v1}, Landroid/support/v4/content/res/TypedArrayUtils;->getNamedString(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_48

    const-string v1, "propertyXName"

    const/4 v2, 0x2

    invoke-static {p1, p4, v1, v2}, Landroid/support/v4/content/res/TypedArrayUtils;->getNamedString(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    const-string v3, "propertyYName"

    const/4 v4, 0x3

    invoke-static {p1, p4, v3, v4}, Landroid/support/v4/content/res/TypedArrayUtils;->getNamedString(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p4

    if-eq p2, v2, :cond_1c

    const/4 v2, 0x4

    :cond_1c
    if-nez v1, :cond_3c

    if-eqz p4, :cond_21

    goto :goto_3c

    :cond_21
    new-instance p0, Landroid/view/InflateException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Landroid/content/res/TypedArray;->getPositionDescription()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " propertyXName or propertyYName is needed for PathData"

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Landroid/view/InflateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_3c
    :goto_3c
    invoke-static {v0}, Landroid/support/v4/graphics/PathParser;->createPathFromPathData(Ljava/lang/String;)Landroid/graphics/Path;

    move-result-object p1

    const/high16 p2, 0x3f000000    # 0.5f

    mul-float p3, p3, p2

    invoke-static {p1, p0, p3, v1, p4}, Landroid/support/graphics/drawable/AnimatorInflaterCompat;->setupPathMotion(Landroid/graphics/Path;Landroid/animation/ObjectAnimator;FLjava/lang/String;Ljava/lang/String;)V

    goto :goto_52

    :cond_48
    const-string p2, "propertyName"

    const/4 p3, 0x0

    invoke-static {p1, p4, p2, p3}, Landroid/support/v4/content/res/TypedArrayUtils;->getNamedString(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/animation/ObjectAnimator;->setPropertyName(Ljava/lang/String;)V

    :goto_52
    return-void
.end method

.method private static setupPathMotion(Landroid/graphics/Path;Landroid/animation/ObjectAnimator;FLjava/lang/String;Ljava/lang/String;)V
    .registers 22

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p3

    move-object/from16 v3, p4

    new-instance v4, Landroid/graphics/PathMeasure;

    const/4 v5, 0x0

    invoke-direct {v4, v0, v5}, Landroid/graphics/PathMeasure;-><init>(Landroid/graphics/Path;Z)V

    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    const/4 v7, 0x0

    invoke-static {v7}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v8

    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/4 v8, 0x0

    :cond_1c
    invoke-virtual {v4}, Landroid/graphics/PathMeasure;->getLength()F

    move-result v9

    add-float/2addr v8, v9

    invoke-static {v8}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v9

    invoke-virtual {v6, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v4}, Landroid/graphics/PathMeasure;->nextContour()Z

    move-result v9

    if-nez v9, :cond_1c

    new-instance v4, Landroid/graphics/PathMeasure;

    invoke-direct {v4, v0, v5}, Landroid/graphics/PathMeasure;-><init>(Landroid/graphics/Path;Z)V

    const/16 v0, 0x64

    div-float v9, v8, p2

    float-to-int v9, v9

    const/4 v10, 0x1

    add-int/2addr v9, v10

    invoke-static {v0, v9}, Ljava/lang/Math;->min(II)I

    move-result v0

    new-array v9, v0, [F

    new-array v11, v0, [F

    const/4 v12, 0x2

    new-array v13, v12, [F

    add-int/lit8 v14, v0, -0x1

    int-to-float v14, v14

    div-float/2addr v8, v14

    const/4 v7, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    :goto_4c
    const/4 v12, 0x0

    if-ge v7, v0, :cond_86

    invoke-virtual {v6, v15}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Ljava/lang/Float;

    invoke-virtual/range {v16 .. v16}, Ljava/lang/Float;->floatValue()F

    move-result v16

    sub-float v10, v14, v16

    invoke-virtual {v4, v10, v13, v12}, Landroid/graphics/PathMeasure;->getPosTan(F[F[F)Z

    aget v10, v13, v5

    aput v10, v9, v7

    const/4 v10, 0x1

    aget v12, v13, v10

    aput v12, v11, v7

    add-float/2addr v14, v8

    add-int/lit8 v10, v15, 0x1

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v12

    if-ge v10, v12, :cond_82

    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/Float;

    invoke-virtual {v12}, Ljava/lang/Float;->floatValue()F

    move-result v12

    cmpl-float v12, v14, v12

    if-lez v12, :cond_82

    invoke-virtual {v4}, Landroid/graphics/PathMeasure;->nextContour()Z

    move v15, v10

    :cond_82
    add-int/lit8 v7, v7, 0x1

    const/4 v10, 0x1

    goto :goto_4c

    :cond_86
    if-eqz v2, :cond_8d

    invoke-static {v2, v9}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v0

    goto :goto_8e

    :cond_8d
    move-object v0, v12

    :goto_8e
    if-eqz v3, :cond_94

    invoke-static {v3, v11}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v12

    :cond_94
    if-nez v0, :cond_9f

    const/4 v2, 0x1

    new-array v0, v2, [Landroid/animation/PropertyValuesHolder;

    aput-object v12, v0, v5

    invoke-virtual {v1, v0}, Landroid/animation/ObjectAnimator;->setValues([Landroid/animation/PropertyValuesHolder;)V

    goto :goto_b4

    :cond_9f
    const/4 v2, 0x1

    if-nez v12, :cond_aa

    new-array v2, v2, [Landroid/animation/PropertyValuesHolder;

    aput-object v0, v2, v5

    invoke-virtual {v1, v2}, Landroid/animation/ObjectAnimator;->setValues([Landroid/animation/PropertyValuesHolder;)V

    goto :goto_b4

    :cond_aa
    const/4 v3, 0x2

    new-array v3, v3, [Landroid/animation/PropertyValuesHolder;

    aput-object v0, v3, v5

    aput-object v12, v3, v2

    invoke-virtual {v1, v3}, Landroid/animation/ObjectAnimator;->setValues([Landroid/animation/PropertyValuesHolder;)V

    :goto_b4
    return-void
.end method
