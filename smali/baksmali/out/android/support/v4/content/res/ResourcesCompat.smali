.class public final Landroid/support/v4/content/res/ResourcesCompat;
.super Ljava/lang/Object;
.source "ResourcesCompat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/content/res/ResourcesCompat$FontCallback;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "ResourcesCompat"


# direct methods
.method private constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getColor(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)I
    .registers 5
    .param p0    # Landroid/content/res/Resources;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # I
        .annotation build Landroid/support/annotation/ColorRes;
        .end annotation
    .end param
    .param p2    # Landroid/content/res/Resources$Theme;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/ColorInt;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/res/Resources$NotFoundException;
        }
    .end annotation

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_b

    invoke-virtual {p0, p1, p2}, Landroid/content/res/Resources;->getColor(ILandroid/content/res/Resources$Theme;)I

    move-result p0

    return p0

    :cond_b
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getColor(I)I

    move-result p0

    return p0
.end method

.method public static getColorStateList(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)Landroid/content/res/ColorStateList;
    .registers 5
    .param p0    # Landroid/content/res/Resources;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # I
        .annotation build Landroid/support/annotation/ColorRes;
        .end annotation
    .end param
    .param p2    # Landroid/content/res/Resources$Theme;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/res/Resources$NotFoundException;
        }
    .end annotation

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_b

    invoke-virtual {p0, p1, p2}, Landroid/content/res/Resources;->getColorStateList(ILandroid/content/res/Resources$Theme;)Landroid/content/res/ColorStateList;

    move-result-object p0

    return-object p0

    :cond_b
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object p0

    return-object p0
.end method

.method public static getDrawable(Landroid/content/res/Resources;ILandroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;
    .registers 5
    .param p0    # Landroid/content/res/Resources;
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

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/res/Resources$NotFoundException;
        }
    .end annotation

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_b

    invoke-virtual {p0, p1, p2}, Landroid/content/res/Resources;->getDrawable(ILandroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0

    :cond_b
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0
.end method

.method public static getDrawableForDensity(Landroid/content/res/Resources;IILandroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;
    .registers 6
    .param p0    # Landroid/content/res/Resources;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param
    .param p3    # Landroid/content/res/Resources$Theme;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/res/Resources$NotFoundException;
        }
    .end annotation

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_b

    invoke-virtual {p0, p1, p2, p3}, Landroid/content/res/Resources;->getDrawableForDensity(IILandroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0

    :cond_b
    sget p3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v0, 0xf

    if-lt p3, v0, :cond_16

    invoke-virtual {p0, p1, p2}, Landroid/content/res/Resources;->getDrawableForDensity(II)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0

    :cond_16
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    return-object p0
.end method

.method public static getFont(Landroid/content/Context;I)Landroid/graphics/Typeface;
    .registers 9
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # I
        .annotation build Landroid/support/annotation/FontRes;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/res/Resources$NotFoundException;
        }
    .end annotation

    invoke-virtual {p0}, Landroid/content/Context;->isRestricted()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 p0, 0x0

    return-object p0

    :cond_8
    new-instance v2, Landroid/util/TypedValue;

    invoke-direct {v2}, Landroid/util/TypedValue;-><init>()V

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v0, p0

    move v1, p1

    invoke-static/range {v0 .. v6}, Landroid/support/v4/content/res/ResourcesCompat;->loadFont(Landroid/content/Context;ILandroid/util/TypedValue;ILandroid/support/v4/content/res/ResourcesCompat$FontCallback;Landroid/os/Handler;Z)Landroid/graphics/Typeface;

    move-result-object p0

    return-object p0
.end method

.method public static getFont(Landroid/content/Context;ILandroid/util/TypedValue;ILandroid/support/v4/content/res/ResourcesCompat$FontCallback;)Landroid/graphics/Typeface;
    .registers 12
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # I
        .annotation build Landroid/support/annotation/FontRes;
        .end annotation
    .end param
    .param p4    # Landroid/support/v4/content/res/ResourcesCompat$FontCallback;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/RestrictTo;
        value = {
            .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/res/Resources$NotFoundException;
        }
    .end annotation

    invoke-virtual {p0}, Landroid/content/Context;->isRestricted()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 p0, 0x0

    return-object p0

    :cond_8
    const/4 v5, 0x0

    const/4 v6, 0x1

    move-object v0, p0

    move v1, p1

    move-object v2, p2

    move v3, p3

    move-object v4, p4

    invoke-static/range {v0 .. v6}, Landroid/support/v4/content/res/ResourcesCompat;->loadFont(Landroid/content/Context;ILandroid/util/TypedValue;ILandroid/support/v4/content/res/ResourcesCompat$FontCallback;Landroid/os/Handler;Z)Landroid/graphics/Typeface;

    move-result-object p0

    return-object p0
.end method

.method public static getFont(Landroid/content/Context;ILandroid/support/v4/content/res/ResourcesCompat$FontCallback;Landroid/os/Handler;)V
    .registers 11
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # I
        .annotation build Landroid/support/annotation/FontRes;
        .end annotation
    .end param
    .param p2    # Landroid/support/v4/content/res/ResourcesCompat$FontCallback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Landroid/os/Handler;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/res/Resources$NotFoundException;
        }
    .end annotation

    invoke-static {p2}, Landroid/support/v4/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0}, Landroid/content/Context;->isRestricted()Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 p0, -0x4

    invoke-virtual {p2, p0, p3}, Landroid/support/v4/content/res/ResourcesCompat$FontCallback;->callbackFailAsync(ILandroid/os/Handler;)V

    return-void

    :cond_e
    new-instance v2, Landroid/util/TypedValue;

    invoke-direct {v2}, Landroid/util/TypedValue;-><init>()V

    const/4 v3, 0x0

    const/4 v6, 0x0

    move-object v0, p0

    move v1, p1

    move-object v4, p2

    move-object v5, p3

    invoke-static/range {v0 .. v6}, Landroid/support/v4/content/res/ResourcesCompat;->loadFont(Landroid/content/Context;ILandroid/util/TypedValue;ILandroid/support/v4/content/res/ResourcesCompat$FontCallback;Landroid/os/Handler;Z)Landroid/graphics/Typeface;

    return-void
.end method

.method private static loadFont(Landroid/content/Context;ILandroid/util/TypedValue;ILandroid/support/v4/content/res/ResourcesCompat$FontCallback;Landroid/os/Handler;Z)Landroid/graphics/Typeface;
    .registers 15
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # Landroid/support/v4/content/res/ResourcesCompat$FontCallback;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p5    # Landroid/os/Handler;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const/4 v0, 0x1

    invoke-virtual {v1, p1, p2, v0}, Landroid/content/res/Resources;->getValue(ILandroid/util/TypedValue;Z)V

    move-object v0, p0

    move-object v2, p2

    move v3, p1

    move v4, p3

    move-object v5, p4

    move-object v6, p5

    move v7, p6

    invoke-static/range {v0 .. v7}, Landroid/support/v4/content/res/ResourcesCompat;->loadFont(Landroid/content/Context;Landroid/content/res/Resources;Landroid/util/TypedValue;IILandroid/support/v4/content/res/ResourcesCompat$FontCallback;Landroid/os/Handler;Z)Landroid/graphics/Typeface;

    move-result-object p0

    if-nez p0, :cond_38

    if-eqz p4, :cond_18

    goto :goto_38

    :cond_18
    new-instance p0, Landroid/content/res/Resources$NotFoundException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "Font resource ID #0x"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " could not be retrieved."

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Landroid/content/res/Resources$NotFoundException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_38
    :goto_38
    return-object p0
.end method

.method private static loadFont(Landroid/content/Context;Landroid/content/res/Resources;Landroid/util/TypedValue;IILandroid/support/v4/content/res/ResourcesCompat$FontCallback;Landroid/os/Handler;Z)Landroid/graphics/Typeface;
    .registers 22
    .param p0    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p5    # Landroid/support/v4/content/res/ResourcesCompat$FontCallback;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p6    # Landroid/os/Handler;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    move-object v0, p1

    move-object/from16 v1, p2

    move/from16 v4, p3

    move/from16 v5, p4

    move-object/from16 v9, p5

    move-object/from16 v10, p6

    iget-object v2, v1, Landroid/util/TypedValue;->string:Ljava/lang/CharSequence;

    if-eqz v2, :cond_ab

    iget-object v1, v1, Landroid/util/TypedValue;->string:Ljava/lang/CharSequence;

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v11

    const-string v1, "res/"

    invoke-virtual {v11, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    const/4 v12, 0x0

    const/4 v13, -0x3

    if-nez v1, :cond_25

    if-eqz v9, :cond_24

    invoke-virtual {v9, v13, v10}, Landroid/support/v4/content/res/ResourcesCompat$FontCallback;->callbackFailAsync(ILandroid/os/Handler;)V

    :cond_24
    return-object v12

    :cond_25
    invoke-static {p1, v4, v5}, Landroid/support/v4/graphics/TypefaceCompat;->findFromCache(Landroid/content/res/Resources;II)Landroid/graphics/Typeface;

    move-result-object v1

    if-eqz v1, :cond_31

    if-eqz v9, :cond_30

    invoke-virtual {v9, v1, v10}, Landroid/support/v4/content/res/ResourcesCompat$FontCallback;->callbackSuccessAsync(Landroid/graphics/Typeface;Landroid/os/Handler;)V

    :cond_30
    return-object v1

    :cond_31
    :try_start_31
    invoke-virtual {v11}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-string v2, ".xml"

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_65

    invoke-virtual {p1, v4}, Landroid/content/res/Resources;->getXml(I)Landroid/content/res/XmlResourceParser;

    move-result-object v1

    invoke-static {v1, p1}, Landroid/support/v4/content/res/FontResourcesParserCompat;->parse(Lorg/xmlpull/v1/XmlPullParser;Landroid/content/res/Resources;)Landroid/support/v4/content/res/FontResourcesParserCompat$FamilyResourceEntry;

    move-result-object v2

    if-nez v2, :cond_54

    const-string v0, "ResourcesCompat"

    const-string v1, "Failed to find font-family tag"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz v9, :cond_53

    invoke-virtual {v9, v13, v10}, Landroid/support/v4/content/res/ResourcesCompat$FontCallback;->callbackFailAsync(ILandroid/os/Handler;)V

    :cond_53
    return-object v12

    :cond_54
    move-object v1, p0

    move-object v3, p1

    move/from16 v4, p3

    move/from16 v5, p4

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    move/from16 v8, p7

    invoke-static/range {v1 .. v8}, Landroid/support/v4/graphics/TypefaceCompat;->createFromResourcesFamilyXml(Landroid/content/Context;Landroid/support/v4/content/res/FontResourcesParserCompat$FamilyResourceEntry;Landroid/content/res/Resources;IILandroid/support/v4/content/res/ResourcesCompat$FontCallback;Landroid/os/Handler;Z)Landroid/graphics/Typeface;

    move-result-object v0

    return-object v0

    :cond_65
    move-object v1, p0

    invoke-static {p0, p1, v4, v11, v5}, Landroid/support/v4/graphics/TypefaceCompat;->createFromResourcesFontFile(Landroid/content/Context;Landroid/content/res/Resources;ILjava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v0

    if-eqz v9, :cond_75

    if-eqz v0, :cond_72

    invoke-virtual {v9, v0, v10}, Landroid/support/v4/content/res/ResourcesCompat$FontCallback;->callbackSuccessAsync(Landroid/graphics/Typeface;Landroid/os/Handler;)V

    goto :goto_75

    :cond_72
    invoke-virtual {v9, v13, v10}, Landroid/support/v4/content/res/ResourcesCompat$FontCallback;->callbackFailAsync(ILandroid/os/Handler;)V
    :try_end_75
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_31 .. :try_end_75} :catch_8e
    .catch Ljava/io/IOException; {:try_start_31 .. :try_end_75} :catch_76

    :cond_75
    :goto_75
    return-object v0

    :catch_76
    move-exception v0

    const-string v1, "ResourcesCompat"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Failed to read xml resource "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_a5

    :catch_8e
    move-exception v0

    const-string v1, "ResourcesCompat"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Failed to parse xml resource "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_a5
    if-eqz v9, :cond_aa

    invoke-virtual {v9, v13, v10}, Landroid/support/v4/content/res/ResourcesCompat$FontCallback;->callbackFailAsync(ILandroid/os/Handler;)V

    :cond_aa
    return-object v12

    :cond_ab
    new-instance v2, Landroid/content/res/Resources$NotFoundException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Resource \""

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v4}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\" ("

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static/range {p3 .. p3}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ") is not a Font: "

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Landroid/content/res/Resources$NotFoundException;-><init>(Ljava/lang/String;)V

    throw v2
.end method
