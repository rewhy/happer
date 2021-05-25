.class public Landroid/support/v4/graphics/PathParser$PathDataNode;
.super Ljava/lang/Object;
.source "PathParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/graphics/PathParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PathDataNode"
.end annotation


# instance fields
.field public mParams:[F
    .annotation build Landroid/support/annotation/RestrictTo;
        value = {
            .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
        }
    .end annotation
.end field

.field public mType:C
    .annotation build Landroid/support/annotation/RestrictTo;
        value = {
            .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(C[F)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-char p1, p0, Landroid/support/v4/graphics/PathParser$PathDataNode;->mType:C

    iput-object p2, p0, Landroid/support/v4/graphics/PathParser$PathDataNode;->mParams:[F

    return-void
.end method

.method constructor <init>(Landroid/support/v4/graphics/PathParser$PathDataNode;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iget-char v0, p1, Landroid/support/v4/graphics/PathParser$PathDataNode;->mType:C

    iput-char v0, p0, Landroid/support/v4/graphics/PathParser$PathDataNode;->mType:C

    iget-object v0, p1, Landroid/support/v4/graphics/PathParser$PathDataNode;->mParams:[F

    iget-object p1, p1, Landroid/support/v4/graphics/PathParser$PathDataNode;->mParams:[F

    array-length p1, p1

    const/4 v1, 0x0

    invoke-static {v0, v1, p1}, Landroid/support/v4/graphics/PathParser;->copyOfRange([FII)[F

    move-result-object p1

    iput-object p1, p0, Landroid/support/v4/graphics/PathParser$PathDataNode;->mParams:[F

    return-void
.end method

.method private static addCommand(Landroid/graphics/Path;[FCC[F)V
    .registers 32

    move-object/from16 v10, p0

    move-object/from16 v13, p4

    const/4 v14, 0x0

    aget v0, p1, v14

    const/4 v15, 0x1

    aget v1, p1, v15

    const/16 v16, 0x2

    aget v2, p1, v16

    const/16 v17, 0x3

    aget v3, p1, v17

    const/16 v18, 0x4

    aget v4, p1, v18

    const/16 v19, 0x5

    aget v5, p1, v19

    sparse-switch p3, :sswitch_data_300

    :goto_1d
    :sswitch_1d
    const/16 v20, 0x2

    goto :goto_38

    :sswitch_20
    invoke-virtual/range {p0 .. p0}, Landroid/graphics/Path;->close()V

    invoke-virtual {v10, v4, v5}, Landroid/graphics/Path;->moveTo(FF)V

    move v0, v4

    move v2, v0

    move v1, v5

    move v3, v1

    goto :goto_1d

    :sswitch_2b
    const/16 v20, 0x4

    goto :goto_38

    :sswitch_2e
    const/16 v20, 0x1

    goto :goto_38

    :sswitch_31
    const/4 v6, 0x6

    const/16 v20, 0x6

    goto :goto_38

    :sswitch_35
    const/4 v6, 0x7

    const/16 v20, 0x7

    :goto_38
    move v8, v0

    move v7, v1

    move/from16 v21, v4

    move/from16 v22, v5

    const/4 v9, 0x0

    move/from16 v0, p2

    :goto_41
    array-length v1, v13

    if-ge v9, v1, :cond_2f0

    const/16 v1, 0x51

    const/16 v5, 0x74

    const/16 v6, 0x73

    const/16 v15, 0x71

    const/16 v14, 0x63

    const/high16 v23, 0x40000000    # 2.0f

    const/4 v4, 0x0

    sparse-switch p3, :sswitch_data_352

    move v12, v7

    move v11, v8

    :goto_56
    move/from16 v25, v9

    goto/16 :goto_2e8

    :sswitch_5a
    add-int/lit8 v0, v9, 0x0

    aget v1, v13, v0

    invoke-virtual {v10, v4, v1}, Landroid/graphics/Path;->rLineTo(FF)V

    aget v0, v13, v0

    add-float/2addr v7, v0

    goto :goto_56

    :sswitch_65
    if-eq v0, v15, :cond_72

    if-eq v0, v5, :cond_72

    if-eq v0, v1, :cond_72

    const/16 v1, 0x54

    if-ne v0, v1, :cond_70

    goto :goto_72

    :cond_70
    const/4 v0, 0x0

    goto :goto_76

    :cond_72
    :goto_72
    sub-float v4, v8, v2

    sub-float v0, v7, v3

    :goto_76
    add-int/lit8 v1, v9, 0x0

    aget v2, v13, v1

    add-int/lit8 v3, v9, 0x1

    aget v5, v13, v3

    invoke-virtual {v10, v4, v0, v2, v5}, Landroid/graphics/Path;->rQuadTo(FFFF)V

    add-float/2addr v4, v8

    add-float/2addr v0, v7

    aget v1, v13, v1

    add-float/2addr v8, v1

    aget v1, v13, v3

    add-float/2addr v7, v1

    move v3, v0

    move v2, v4

    goto :goto_56

    :sswitch_8c
    if-eq v0, v14, :cond_9c

    if-eq v0, v6, :cond_9c

    const/16 v1, 0x43

    if-eq v0, v1, :cond_9c

    const/16 v1, 0x53

    if-ne v0, v1, :cond_99

    goto :goto_9c

    :cond_99
    const/4 v1, 0x0

    const/4 v2, 0x0

    goto :goto_a2

    :cond_9c
    :goto_9c
    sub-float v0, v8, v2

    sub-float v1, v7, v3

    move v2, v1

    move v1, v0

    :goto_a2
    add-int/lit8 v14, v9, 0x0

    aget v3, v13, v14

    add-int/lit8 v15, v9, 0x1

    aget v4, v13, v15

    add-int/lit8 v23, v9, 0x2

    aget v5, v13, v23

    add-int/lit8 v24, v9, 0x3

    aget v6, v13, v24

    move-object/from16 v0, p0

    invoke-virtual/range {v0 .. v6}, Landroid/graphics/Path;->rCubicTo(FFFFFF)V

    aget v0, v13, v14

    add-float/2addr v0, v8

    aget v1, v13, v15

    add-float/2addr v1, v7

    aget v2, v13, v23

    add-float/2addr v8, v2

    aget v2, v13, v24

    add-float/2addr v7, v2

    goto/16 :goto_14f

    :sswitch_c5
    add-int/lit8 v0, v9, 0x0

    aget v1, v13, v0

    add-int/lit8 v2, v9, 0x1

    aget v3, v13, v2

    add-int/lit8 v4, v9, 0x2

    aget v5, v13, v4

    add-int/lit8 v6, v9, 0x3

    aget v14, v13, v6

    invoke-virtual {v10, v1, v3, v5, v14}, Landroid/graphics/Path;->rQuadTo(FFFF)V

    aget v0, v13, v0

    add-float/2addr v0, v8

    aget v1, v13, v2

    add-float/2addr v1, v7

    aget v2, v13, v4

    add-float/2addr v8, v2

    aget v2, v13, v6

    add-float/2addr v7, v2

    goto :goto_14f

    :sswitch_e5
    add-int/lit8 v0, v9, 0x0

    aget v1, v13, v0

    add-float/2addr v8, v1

    add-int/lit8 v1, v9, 0x1

    aget v4, v13, v1

    add-float/2addr v7, v4

    if-lez v9, :cond_fa

    aget v0, v13, v0

    aget v1, v13, v1

    invoke-virtual {v10, v0, v1}, Landroid/graphics/Path;->rLineTo(FF)V

    goto/16 :goto_56

    :cond_fa
    aget v0, v13, v0

    aget v1, v13, v1

    invoke-virtual {v10, v0, v1}, Landroid/graphics/Path;->rMoveTo(FF)V

    move/from16 v22, v7

    move/from16 v21, v8

    goto/16 :goto_56

    :sswitch_107
    add-int/lit8 v0, v9, 0x0

    aget v1, v13, v0

    add-int/lit8 v4, v9, 0x1

    aget v5, v13, v4

    invoke-virtual {v10, v1, v5}, Landroid/graphics/Path;->rLineTo(FF)V

    aget v0, v13, v0

    add-float/2addr v8, v0

    aget v0, v13, v4

    add-float/2addr v7, v0

    goto/16 :goto_56

    :sswitch_11a
    add-int/lit8 v0, v9, 0x0

    aget v1, v13, v0

    invoke-virtual {v10, v1, v4}, Landroid/graphics/Path;->rLineTo(FF)V

    aget v0, v13, v0

    add-float/2addr v8, v0

    goto/16 :goto_56

    :sswitch_126
    add-int/lit8 v0, v9, 0x0

    aget v1, v13, v0

    add-int/lit8 v0, v9, 0x1

    aget v2, v13, v0

    add-int/lit8 v14, v9, 0x2

    aget v3, v13, v14

    add-int/lit8 v15, v9, 0x3

    aget v4, v13, v15

    add-int/lit8 v23, v9, 0x4

    aget v5, v13, v23

    add-int/lit8 v24, v9, 0x5

    aget v6, v13, v24

    move-object/from16 v0, p0

    invoke-virtual/range {v0 .. v6}, Landroid/graphics/Path;->rCubicTo(FFFFFF)V

    aget v0, v13, v14

    add-float/2addr v0, v8

    aget v1, v13, v15

    add-float/2addr v1, v7

    aget v2, v13, v23

    add-float/2addr v8, v2

    aget v2, v13, v24

    add-float/2addr v7, v2

    :goto_14f
    move v2, v0

    move v3, v1

    goto/16 :goto_56

    :sswitch_153
    add-int/lit8 v14, v9, 0x5

    aget v0, v13, v14

    add-float v3, v0, v8

    add-int/lit8 v15, v9, 0x6

    aget v0, v13, v15

    add-float v5, v0, v7

    add-int/lit8 v0, v9, 0x0

    aget v6, v13, v0

    add-int/lit8 v0, v9, 0x1

    aget v23, v13, v0

    add-int/lit8 v0, v9, 0x2

    aget v24, v13, v0

    add-int/lit8 v0, v9, 0x3

    aget v0, v13, v0

    cmpl-float v0, v0, v4

    if-eqz v0, :cond_176

    const/16 v25, 0x1

    goto :goto_178

    :cond_176
    const/16 v25, 0x0

    :goto_178
    add-int/lit8 v0, v9, 0x4

    aget v0, v13, v0

    cmpl-float v0, v0, v4

    if-eqz v0, :cond_183

    const/16 v26, 0x1

    goto :goto_185

    :cond_183
    const/16 v26, 0x0

    :goto_185
    move-object/from16 v0, p0

    move v1, v8

    move v2, v7

    move v4, v5

    move v5, v6

    move/from16 v6, v23

    move v12, v7

    move/from16 v7, v24

    move v11, v8

    move/from16 v8, v25

    move/from16 v25, v9

    move/from16 v9, v26

    invoke-static/range {v0 .. v9}, Landroid/support/v4/graphics/PathParser$PathDataNode;->drawArc(Landroid/graphics/Path;FFFFFFFZZ)V

    aget v0, v13, v14

    add-float v8, v11, v0

    aget v0, v13, v15

    add-float v7, v12, v0

    goto/16 :goto_2e6

    :sswitch_1a4
    move v11, v8

    move/from16 v25, v9

    add-int/lit8 v9, v25, 0x0

    aget v0, v13, v9

    invoke-virtual {v10, v11, v0}, Landroid/graphics/Path;->lineTo(FF)V

    aget v7, v13, v9

    goto/16 :goto_2e8

    :sswitch_1b2
    move v12, v7

    move v11, v8

    move/from16 v25, v9

    if-eq v0, v15, :cond_1c0

    if-eq v0, v5, :cond_1c0

    if-eq v0, v1, :cond_1c0

    const/16 v1, 0x54

    if-ne v0, v1, :cond_1c8

    :cond_1c0
    mul-float v8, v11, v23

    sub-float/2addr v8, v2

    mul-float v7, v12, v23

    sub-float/2addr v7, v3

    move v12, v7

    move v11, v8

    :cond_1c8
    add-int/lit8 v9, v25, 0x0

    aget v0, v13, v9

    add-int/lit8 v1, v25, 0x1

    aget v2, v13, v1

    invoke-virtual {v10, v11, v12, v0, v2}, Landroid/graphics/Path;->quadTo(FFFF)V

    aget v8, v13, v9

    aget v7, v13, v1

    move v2, v11

    move v3, v12

    goto/16 :goto_2e8

    :sswitch_1db
    move v12, v7

    move v11, v8

    move/from16 v25, v9

    if-eq v0, v14, :cond_1ef

    if-eq v0, v6, :cond_1ef

    const/16 v1, 0x43

    if-eq v0, v1, :cond_1ef

    const/16 v1, 0x53

    if-ne v0, v1, :cond_1ec

    goto :goto_1ef

    :cond_1ec
    move v1, v11

    move v2, v12

    goto :goto_1f7

    :cond_1ef
    :goto_1ef
    mul-float v8, v11, v23

    sub-float/2addr v8, v2

    mul-float v7, v12, v23

    sub-float/2addr v7, v3

    move v2, v7

    move v1, v8

    :goto_1f7
    add-int/lit8 v9, v25, 0x0

    aget v3, v13, v9

    add-int/lit8 v7, v25, 0x1

    aget v4, v13, v7

    add-int/lit8 v8, v25, 0x2

    aget v5, v13, v8

    add-int/lit8 v11, v25, 0x3

    aget v6, v13, v11

    move-object/from16 v0, p0

    invoke-virtual/range {v0 .. v6}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    aget v0, v13, v9

    aget v1, v13, v7

    aget v8, v13, v8

    aget v7, v13, v11

    goto :goto_232

    :sswitch_215
    move/from16 v25, v9

    add-int/lit8 v9, v25, 0x0

    aget v0, v13, v9

    add-int/lit8 v1, v25, 0x1

    aget v2, v13, v1

    add-int/lit8 v3, v25, 0x2

    aget v4, v13, v3

    add-int/lit8 v5, v25, 0x3

    aget v6, v13, v5

    invoke-virtual {v10, v0, v2, v4, v6}, Landroid/graphics/Path;->quadTo(FFFF)V

    aget v0, v13, v9

    aget v1, v13, v1

    aget v8, v13, v3

    aget v7, v13, v5

    :goto_232
    move v2, v0

    move v3, v1

    goto/16 :goto_2e8

    :sswitch_236
    move/from16 v25, v9

    add-int/lit8 v9, v25, 0x0

    aget v8, v13, v9

    add-int/lit8 v0, v25, 0x1

    aget v7, v13, v0

    if-lez v25, :cond_24b

    aget v1, v13, v9

    aget v0, v13, v0

    invoke-virtual {v10, v1, v0}, Landroid/graphics/Path;->lineTo(FF)V

    goto/16 :goto_2e8

    :cond_24b
    aget v1, v13, v9

    aget v0, v13, v0

    invoke-virtual {v10, v1, v0}, Landroid/graphics/Path;->moveTo(FF)V

    move/from16 v22, v7

    move/from16 v21, v8

    goto/16 :goto_2e8

    :sswitch_258
    move/from16 v25, v9

    add-int/lit8 v9, v25, 0x0

    aget v0, v13, v9

    add-int/lit8 v1, v25, 0x1

    aget v4, v13, v1

    invoke-virtual {v10, v0, v4}, Landroid/graphics/Path;->lineTo(FF)V

    aget v8, v13, v9

    aget v7, v13, v1

    goto/16 :goto_2e8

    :sswitch_26b
    move v12, v7

    move/from16 v25, v9

    add-int/lit8 v9, v25, 0x0

    aget v0, v13, v9

    invoke-virtual {v10, v0, v12}, Landroid/graphics/Path;->lineTo(FF)V

    aget v8, v13, v9

    goto/16 :goto_2e8

    :sswitch_279
    move/from16 v25, v9

    add-int/lit8 v9, v25, 0x0

    aget v1, v13, v9

    add-int/lit8 v9, v25, 0x1

    aget v2, v13, v9

    add-int/lit8 v9, v25, 0x2

    aget v3, v13, v9

    add-int/lit8 v7, v25, 0x3

    aget v4, v13, v7

    add-int/lit8 v8, v25, 0x4

    aget v5, v13, v8

    add-int/lit8 v11, v25, 0x5

    aget v6, v13, v11

    move-object/from16 v0, p0

    invoke-virtual/range {v0 .. v6}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    aget v8, v13, v8

    aget v0, v13, v11

    aget v1, v13, v9

    aget v2, v13, v7

    move v7, v0

    move v3, v2

    move v2, v1

    goto :goto_2e8

    :sswitch_2a4
    move v12, v7

    move v11, v8

    move/from16 v25, v9

    add-int/lit8 v14, v25, 0x5

    aget v3, v13, v14

    add-int/lit8 v15, v25, 0x6

    aget v5, v13, v15

    add-int/lit8 v9, v25, 0x0

    aget v6, v13, v9

    add-int/lit8 v9, v25, 0x1

    aget v7, v13, v9

    add-int/lit8 v9, v25, 0x2

    aget v8, v13, v9

    add-int/lit8 v9, v25, 0x3

    aget v0, v13, v9

    cmpl-float v0, v0, v4

    if-eqz v0, :cond_2c6

    const/4 v9, 0x1

    goto :goto_2c7

    :cond_2c6
    const/4 v9, 0x0

    :goto_2c7
    add-int/lit8 v0, v25, 0x4

    aget v0, v13, v0

    cmpl-float v0, v0, v4

    if-eqz v0, :cond_2d2

    const/16 v23, 0x1

    goto :goto_2d4

    :cond_2d2
    const/16 v23, 0x0

    :goto_2d4
    move-object/from16 v0, p0

    move v1, v11

    move v2, v12

    move v4, v5

    move v5, v6

    move v6, v7

    move v7, v8

    move v8, v9

    move/from16 v9, v23

    invoke-static/range {v0 .. v9}, Landroid/support/v4/graphics/PathParser$PathDataNode;->drawArc(Landroid/graphics/Path;FFFFFFFZZ)V

    aget v8, v13, v14

    aget v7, v13, v15

    :goto_2e6
    move v3, v7

    move v2, v8

    :goto_2e8
    add-int v9, v25, v20

    move/from16 v0, p3

    const/4 v14, 0x0

    const/4 v15, 0x1

    goto/16 :goto_41

    :cond_2f0
    move v12, v7

    const/4 v1, 0x0

    aput v8, p1, v1

    const/4 v1, 0x1

    aput v12, p1, v1

    aput v2, p1, v16

    aput v3, p1, v17

    aput v21, p1, v18

    aput v22, p1, v19

    return-void

    :sswitch_data_300
    .sparse-switch
        0x41 -> :sswitch_35
        0x43 -> :sswitch_31
        0x48 -> :sswitch_2e
        0x4c -> :sswitch_1d
        0x4d -> :sswitch_1d
        0x51 -> :sswitch_2b
        0x53 -> :sswitch_2b
        0x54 -> :sswitch_1d
        0x56 -> :sswitch_2e
        0x5a -> :sswitch_20
        0x61 -> :sswitch_35
        0x63 -> :sswitch_31
        0x68 -> :sswitch_2e
        0x6c -> :sswitch_1d
        0x6d -> :sswitch_1d
        0x71 -> :sswitch_2b
        0x73 -> :sswitch_2b
        0x74 -> :sswitch_1d
        0x76 -> :sswitch_2e
        0x7a -> :sswitch_20
    .end sparse-switch

    :sswitch_data_352
    .sparse-switch
        0x41 -> :sswitch_2a4
        0x43 -> :sswitch_279
        0x48 -> :sswitch_26b
        0x4c -> :sswitch_258
        0x4d -> :sswitch_236
        0x51 -> :sswitch_215
        0x53 -> :sswitch_1db
        0x54 -> :sswitch_1b2
        0x56 -> :sswitch_1a4
        0x61 -> :sswitch_153
        0x63 -> :sswitch_126
        0x68 -> :sswitch_11a
        0x6c -> :sswitch_107
        0x6d -> :sswitch_e5
        0x71 -> :sswitch_c5
        0x73 -> :sswitch_8c
        0x74 -> :sswitch_65
        0x76 -> :sswitch_5a
    .end sparse-switch
.end method

.method private static arcToBezier(Landroid/graphics/Path;DDDDDDDDD)V
    .registers 74

    move-wide/from16 v0, p5

    const-wide/high16 v6, 0x4010000000000000L    # 4.0

    mul-double v8, p17, v6

    const-wide v10, 0x400921fb54442d18L    # Math.PI

    div-double/2addr v8, v10

    invoke-static {v8, v9}, Ljava/lang/Math;->abs(D)D

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v8

    double-to-int v8, v8

    invoke-static/range {p13 .. p14}, Ljava/lang/Math;->cos(D)D

    move-result-wide v9

    invoke-static/range {p13 .. p14}, Ljava/lang/Math;->sin(D)D

    move-result-wide v11

    invoke-static/range {p15 .. p16}, Ljava/lang/Math;->cos(D)D

    move-result-wide v13

    invoke-static/range {p15 .. p16}, Ljava/lang/Math;->sin(D)D

    move-result-wide v15

    neg-double v6, v0

    mul-double v18, v6, v9

    mul-double v20, v18, v15

    mul-double v22, p7, v11

    mul-double v24, v22, v13

    sub-double v20, v20, v24

    mul-double v6, v6, v11

    mul-double v15, v15, v6

    mul-double v2, p7, v9

    mul-double v13, v13, v2

    add-double/2addr v15, v13

    int-to-double v13, v8

    invoke-static {v13, v14}, Ljava/lang/Double;->isNaN(D)Z

    div-double v4, p17, v13

    const/4 v13, 0x0

    move-wide/from16 v26, p11

    move-wide/from16 v28, v15

    move-wide/from16 v24, v20

    move-wide/from16 v20, p9

    move-wide/from16 v14, p15

    :goto_4a
    if-ge v13, v8, :cond_ef

    add-double v30, v14, v4

    invoke-static/range {v30 .. v31}, Ljava/lang/Math;->sin(D)D

    move-result-wide v32

    invoke-static/range {v30 .. v31}, Ljava/lang/Math;->cos(D)D

    move-result-wide v34

    mul-double v36, v0, v9

    mul-double v36, v36, v34

    add-double v36, p1, v36

    mul-double v38, v22, v32

    move-wide/from16 v40, v4

    sub-double v4, v36, v38

    mul-double v36, v0, v11

    mul-double v36, v36, v34

    add-double v36, p3, v36

    mul-double v42, v2, v32

    add-double v0, v36, v42

    mul-double v36, v18, v32

    mul-double v42, v22, v34

    sub-double v36, v36, v42

    mul-double v32, v32, v6

    mul-double v34, v34, v2

    add-double v32, v32, v34

    sub-double v14, v30, v14

    const-wide/high16 v34, 0x4000000000000000L    # 2.0

    div-double v34, v14, v34

    invoke-static/range {v34 .. v35}, Ljava/lang/Math;->tan(D)D

    move-result-wide v34

    invoke-static {v14, v15}, Ljava/lang/Math;->sin(D)D

    move-result-wide v14

    const-wide/high16 v42, 0x4008000000000000L    # 3.0

    mul-double v44, v34, v42

    mul-double v44, v44, v34

    const-wide/high16 v16, 0x4010000000000000L    # 4.0

    add-double v44, v44, v16

    invoke-static/range {v44 .. v45}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v34

    const-wide/high16 v44, 0x3ff0000000000000L    # 1.0

    sub-double v34, v34, v44

    mul-double v14, v14, v34

    div-double v14, v14, v42

    mul-double v24, v24, v14

    move-wide/from16 v46, v2

    add-double v2, v20, v24

    mul-double v28, v28, v14

    move-wide/from16 v48, v6

    add-double v6, v26, v28

    mul-double v20, v14, v36

    move/from16 v50, v8

    move-wide/from16 v51, v9

    sub-double v8, v4, v20

    mul-double v14, v14, v32

    sub-double v14, v0, v14

    const/4 v10, 0x0

    move-wide/from16 v53, v11

    move-object/from16 v11, p0

    invoke-virtual {v11, v10, v10}, Landroid/graphics/Path;->rLineTo(FF)V

    double-to-float v2, v2

    double-to-float v3, v6

    double-to-float v6, v8

    double-to-float v7, v14

    double-to-float v8, v4

    double-to-float v9, v0

    move-object/from16 p7, p0

    move/from16 p8, v2

    move/from16 p9, v3

    move/from16 p10, v6

    move/from16 p11, v7

    move/from16 p12, v8

    move/from16 p13, v9

    invoke-virtual/range {p7 .. p13}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    add-int/lit8 v13, v13, 0x1

    move-wide/from16 v26, v0

    move-wide/from16 v20, v4

    move-wide/from16 v14, v30

    move-wide/from16 v28, v32

    move-wide/from16 v24, v36

    move-wide/from16 v4, v40

    move-wide/from16 v2, v46

    move-wide/from16 v6, v48

    move/from16 v8, v50

    move-wide/from16 v9, v51

    move-wide/from16 v11, v53

    move-wide/from16 v0, p5

    goto/16 :goto_4a

    :cond_ef
    return-void
.end method

.method private static drawArc(Landroid/graphics/Path;FFFFFFFZZ)V
    .registers 51

    move/from16 v1, p1

    move/from16 v3, p3

    move/from16 v0, p5

    move/from16 v2, p6

    move/from16 v7, p7

    move/from16 v9, p9

    float-to-double v4, v7

    invoke-static {v4, v5}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v19

    invoke-static/range {v19 .. v20}, Ljava/lang/Math;->cos(D)D

    move-result-wide v4

    invoke-static/range {v19 .. v20}, Ljava/lang/Math;->sin(D)D

    move-result-wide v10

    float-to-double v13, v1

    invoke-static {v13, v14}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v15, v13, v4

    move/from16 v6, p2

    move-wide/from16 v25, v13

    float-to-double v13, v6

    invoke-static {v13, v14}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v17, v13, v10

    add-double v15, v15, v17

    float-to-double v6, v0

    invoke-static {v6, v7}, Ljava/lang/Double;->isNaN(D)Z

    div-double/2addr v15, v6

    neg-float v8, v1

    float-to-double v8, v8

    invoke-static {v8, v9}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v8, v8, v10

    invoke-static {v13, v14}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v17, v13, v4

    add-double v8, v8, v17

    move-wide/from16 v27, v13

    float-to-double v13, v2

    invoke-static {v13, v14}, Ljava/lang/Double;->isNaN(D)Z

    div-double/2addr v8, v13

    float-to-double v1, v3

    invoke-static {v1, v2}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v1, v1, v4

    move/from16 v12, p4

    move-wide/from16 v29, v8

    float-to-double v8, v12

    invoke-static {v8, v9}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v17, v8, v10

    add-double v1, v1, v17

    invoke-static {v6, v7}, Ljava/lang/Double;->isNaN(D)Z

    div-double/2addr v1, v6

    neg-float v12, v3

    move-wide/from16 v31, v6

    float-to-double v6, v12

    invoke-static {v6, v7}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v6, v6, v10

    invoke-static {v8, v9}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v8, v8, v4

    add-double/2addr v6, v8

    invoke-static {v13, v14}, Ljava/lang/Double;->isNaN(D)Z

    div-double/2addr v6, v13

    sub-double v8, v15, v1

    sub-double v17, v29, v6

    add-double v21, v15, v1

    const-wide/high16 v23, 0x4000000000000000L    # 2.0

    div-double v21, v21, v23

    add-double v33, v29, v6

    div-double v33, v33, v23

    mul-double v23, v8, v8

    mul-double v35, v17, v17

    move-wide/from16 v37, v10

    add-double v10, v23, v35

    const-wide/16 v23, 0x0

    cmpl-double v12, v10, v23

    if-nez v12, :cond_92

    const-string v0, "PathParser"

    const-string v1, " Points are coincident"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_92
    const-wide/high16 v35, 0x3ff0000000000000L    # 1.0

    div-double v35, v35, v10

    const-wide/high16 v39, 0x3fd0000000000000L    # 0.25

    sub-double v35, v35, v39

    cmpg-double v12, v35, v23

    if-gez v12, :cond_d9

    const-string v1, "PathParser"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Points are too far apart "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v10, v11}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {v10, v11}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v1

    const-wide v4, 0x3ffffff583a53b8eL    # 1.99999

    div-double/2addr v1, v4

    double-to-float v1, v1

    mul-float v5, v0, v1

    move/from16 v0, p6

    mul-float v6, v0, v1

    move-object/from16 v0, p0

    move/from16 v1, p1

    move/from16 v2, p2

    move/from16 v3, p3

    move/from16 v4, p4

    move/from16 v7, p7

    move/from16 v8, p8

    move/from16 v9, p9

    invoke-static/range {v0 .. v9}, Landroid/support/v4/graphics/PathParser$PathDataNode;->drawArc(Landroid/graphics/Path;FFFFFFFZZ)V

    return-void

    :cond_d9
    invoke-static/range {v35 .. v36}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v10

    mul-double v8, v8, v10

    mul-double v10, v10, v17

    move/from16 v0, p8

    move/from16 v3, p9

    if-ne v0, v3, :cond_ec

    sub-double v21, v21, v10

    add-double v33, v33, v8

    goto :goto_f1

    :cond_ec
    const/4 v0, 0x0

    add-double v21, v21, v10

    sub-double v33, v33, v8

    :goto_f1
    const/4 v0, 0x0

    sub-double v8, v29, v33

    sub-double v10, v15, v21

    invoke-static {v8, v9, v10, v11}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v29

    sub-double v6, v6, v33

    sub-double v1, v1, v21

    invoke-static {v6, v7, v1, v2}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v0

    sub-double v0, v0, v29

    cmpl-double v2, v0, v23

    if-ltz v2, :cond_10a

    const/4 v2, 0x1

    goto :goto_10b

    :cond_10a
    const/4 v2, 0x0

    :goto_10b
    if-eq v3, v2, :cond_11a

    const-wide v2, 0x401921fb54442d18L    # 6.283185307179586

    cmpl-double v6, v0, v23

    if-lez v6, :cond_118

    sub-double/2addr v0, v2

    goto :goto_11a

    :cond_118
    const/4 v6, 0x0

    add-double/2addr v0, v2

    :cond_11a
    :goto_11a
    move-wide/from16 v23, v0

    invoke-static/range {v31 .. v32}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v21, v21, v31

    invoke-static {v13, v14}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v33, v33, v13

    mul-double v0, v21, v4

    mul-double v10, v33, v37

    sub-double v7, v0, v10

    move-wide/from16 v0, v31

    mul-double v21, v21, v37

    mul-double v33, v33, v4

    add-double v9, v21, v33

    move-object/from16 v6, p0

    move-wide v11, v0

    move-wide/from16 v0, v25

    move-wide/from16 v2, v27

    move-wide v15, v0

    move-wide/from16 v17, v2

    move-wide/from16 v21, v29

    invoke-static/range {v6 .. v24}, Landroid/support/v4/graphics/PathParser$PathDataNode;->arcToBezier(Landroid/graphics/Path;DDDDDDDDD)V

    return-void
.end method

.method public static nodesToPath([Landroid/support/v4/graphics/PathParser$PathDataNode;Landroid/graphics/Path;)V
    .registers 7

    const/4 v0, 0x6

    new-array v0, v0, [F

    const/16 v1, 0x6d

    const/4 v2, 0x0

    :goto_6
    array-length v3, p0

    if-ge v2, v3, :cond_1b

    aget-object v3, p0, v2

    iget-char v3, v3, Landroid/support/v4/graphics/PathParser$PathDataNode;->mType:C

    aget-object v4, p0, v2

    iget-object v4, v4, Landroid/support/v4/graphics/PathParser$PathDataNode;->mParams:[F

    invoke-static {p1, v0, v1, v3, v4}, Landroid/support/v4/graphics/PathParser$PathDataNode;->addCommand(Landroid/graphics/Path;[FCC[F)V

    aget-object v1, p0, v2

    iget-char v1, v1, Landroid/support/v4/graphics/PathParser$PathDataNode;->mType:C

    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    :cond_1b
    return-void
.end method


# virtual methods
.method public interpolatePathDataNode(Landroid/support/v4/graphics/PathParser$PathDataNode;Landroid/support/v4/graphics/PathParser$PathDataNode;F)V
    .registers 8

    const/4 v0, 0x0

    :goto_1
    iget-object v1, p1, Landroid/support/v4/graphics/PathParser$PathDataNode;->mParams:[F

    array-length v1, v1

    if-ge v0, v1, :cond_1d

    iget-object v1, p0, Landroid/support/v4/graphics/PathParser$PathDataNode;->mParams:[F

    iget-object v2, p1, Landroid/support/v4/graphics/PathParser$PathDataNode;->mParams:[F

    aget v2, v2, v0

    const/high16 v3, 0x3f800000    # 1.0f

    sub-float/2addr v3, p3

    mul-float v2, v2, v3

    iget-object v3, p2, Landroid/support/v4/graphics/PathParser$PathDataNode;->mParams:[F

    aget v3, v3, v0

    mul-float v3, v3, p3

    add-float/2addr v2, v3

    aput v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_1d
    return-void
.end method
