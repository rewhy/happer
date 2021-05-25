.class public final Landroid/support/v4/text/ICUCompat;
.super Ljava/lang/Object;
.source "ICUCompat.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "ICUCompat"

.field private static sAddLikelySubtagsMethod:Ljava/lang/reflect/Method;

.field private static sGetScriptMethod:Ljava/lang/reflect/Method;


# direct methods
.method static constructor <clinit>()V
    .registers 6

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    const/16 v3, 0x15

    if-lt v0, v3, :cond_24

    :try_start_8
    const-string v0, "libcore.icu.ICU"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v3, "addLikelySubtags"

    new-array v2, v2, [Ljava/lang/Class;

    const-class v4, Ljava/util/Locale;

    aput-object v4, v2, v1

    invoke-virtual {v0, v3, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Landroid/support/v4/text/ICUCompat;->sAddLikelySubtagsMethod:Ljava/lang/reflect/Method;
    :try_end_1c
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_1c} :catch_1d

    goto :goto_54

    :catch_1d
    move-exception v0

    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    :cond_24
    :try_start_24
    const-string v0, "libcore.icu.ICU"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    if-eqz v0, :cond_54

    const-string v3, "getScript"

    new-array v4, v2, [Ljava/lang/Class;

    const-class v5, Ljava/lang/String;

    aput-object v5, v4, v1

    invoke-virtual {v0, v3, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    sput-object v3, Landroid/support/v4/text/ICUCompat;->sGetScriptMethod:Ljava/lang/reflect/Method;

    const-string v3, "addLikelySubtags"

    new-array v2, v2, [Ljava/lang/Class;

    const-class v4, Ljava/lang/String;

    aput-object v4, v2, v1

    invoke-virtual {v0, v3, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Landroid/support/v4/text/ICUCompat;->sAddLikelySubtagsMethod:Ljava/lang/reflect/Method;
    :try_end_48
    .catch Ljava/lang/Exception; {:try_start_24 .. :try_end_48} :catch_49

    goto :goto_54

    :catch_49
    move-exception v0

    const/4 v1, 0x0

    sput-object v1, Landroid/support/v4/text/ICUCompat;->sGetScriptMethod:Ljava/lang/reflect/Method;

    sput-object v1, Landroid/support/v4/text/ICUCompat;->sAddLikelySubtagsMethod:Ljava/lang/reflect/Method;

    const-string v1, "ICUCompat"

    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_54
    :goto_54
    return-void
.end method

.method private constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static addLikelySubtags(Ljava/util/Locale;)Ljava/lang/String;
    .registers 4

    invoke-virtual {p0}, Ljava/util/Locale;->toString()Ljava/lang/String;

    move-result-object p0

    :try_start_4
    sget-object v0, Landroid/support/v4/text/ICUCompat;->sAddLikelySubtagsMethod:Ljava/lang/reflect/Method;

    if-eqz v0, :cond_25

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    sget-object v1, Landroid/support/v4/text/ICUCompat;->sAddLikelySubtagsMethod:Ljava/lang/reflect/Method;

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;
    :try_end_17
    .catch Ljava/lang/IllegalAccessException; {:try_start_4 .. :try_end_17} :catch_1f
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_4 .. :try_end_17} :catch_18

    return-object v0

    :catch_18
    move-exception v0

    const-string v1, "ICUCompat"

    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_25

    :catch_1f
    move-exception v0

    const-string v1, "ICUCompat"

    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_25
    :goto_25
    return-object p0
.end method

.method private static getScript(Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    const/4 v0, 0x0

    :try_start_1
    sget-object v1, Landroid/support/v4/text/ICUCompat;->sGetScriptMethod:Ljava/lang/reflect/Method;

    if-eqz v1, :cond_21

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p0, v1, v2

    sget-object p0, Landroid/support/v4/text/ICUCompat;->sGetScriptMethod:Ljava/lang/reflect/Method;

    invoke-virtual {p0, v0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;
    :try_end_13
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_13} :catch_1b
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_1 .. :try_end_13} :catch_14

    return-object p0

    :catch_14
    move-exception p0

    const-string v1, "ICUCompat"

    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_21

    :catch_1b
    move-exception p0

    const-string v1, "ICUCompat"

    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_21
    :goto_21
    return-object v0
.end method

.method public static maximizeAndGetScript(Ljava/util/Locale;)Ljava/lang/String;
    .registers 4
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/4 v1, 0x0

    const/16 v2, 0x15

    if-lt v0, v2, :cond_2c

    const/4 v0, 0x1

    :try_start_8
    new-array v0, v0, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p0, v0, v2

    sget-object v2, Landroid/support/v4/text/ICUCompat;->sAddLikelySubtagsMethod:Ljava/lang/reflect/Method;

    invoke-virtual {v2, v1, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Locale;

    invoke-virtual {v0}, Ljava/util/Locale;->getScript()Ljava/lang/String;

    move-result-object v0
    :try_end_19
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_8 .. :try_end_19} :catch_21
    .catch Ljava/lang/IllegalAccessException; {:try_start_8 .. :try_end_19} :catch_1a

    return-object v0

    :catch_1a
    move-exception v0

    const-string v1, "ICUCompat"

    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_27

    :catch_21
    move-exception v0

    const-string v1, "ICUCompat"

    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_27
    invoke-virtual {p0}, Ljava/util/Locale;->getScript()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_2c
    invoke-static {p0}, Landroid/support/v4/text/ICUCompat;->addLikelySubtags(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_37

    invoke-static {p0}, Landroid/support/v4/text/ICUCompat;->getScript(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_37
    return-object v1
.end method
