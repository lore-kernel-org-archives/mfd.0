Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5584A8A3E
	for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 07:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792050583; cv=pass; b=JRMk9Oezu3lQetLHtlM+ZGH32RJr1nbWvQ/8pKQ8lKNbhBbDrft48Emhv+r+7mfzNHNyeXyZ8DZrNh1SLMd77/Q3YZE8JOyLvv+gz6cycjs7R4A8jxelKtiVlemc7PhvjFV0Dsz75rlHOAa5qlcSVunPfX8a6kG+tFx8miqFH/g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792050583; c=relaxed/simple;
	bh=s0GzHLToX8l2pJV6FGUrdQW+qoZWtYzYSSm2Om3AhAk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SVyjEkOF5woc/vbQg9F82Dqj6hh0n8g6kgIjYrR2ZdHaic+JazghoXtzjG2LqdN7EW/SmFDabAiNs2jfvjszeYEzcg1vHjl/W9iTUwRrMmwVWkqMi+912PPN/0YhHeAgeD46bUrEvy0OiuZgPRyVD1jwMa7Na5M15kviSY9T+VY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c7+8pm8o; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c7+8pm8o"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso3337022eec.0
        for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 00:49:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792050580; cv=none;
        d=google.com; s=arc-20260327;
        b=KUUowNb1H3CSIb5nivWcz+STcJC2qYPCE3PZBdpPmhVIels7/n9CoVkn0p7HlIlxeS
         2tBst/tFxgGp3WZKxFhUdz0CndTwuY0eHG06R/+2qMYQ+TC0l7+mmoFl6X13vCXOXM+x
         +Falvnu7UiE3CRjOA/Al15EhcJ7HN5JzDYPIgFf+HcRGq8xCo2szXXLsqs/uVAoUiL9R
         IRg9umVLcQLgtWSManG0alN79iIYsDswn1wA1n8ijn7jBhOBC0QdgyDvsMub8NA3QHEX
         bpH7T+FaWSvdrlKBIPPCa2Xo6mGv8ssxe9B681PWW2pLCCD/TMBTTfh+A7ddaHdlNCOF
         GhRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bn76A1L1zSnfTuyCF8XnV2/uvU4lFD6V/f9S5z9LEdU=;
        fh=mmaKZVMxaosN0Luq0KzKuA/ZTiAUsNr4YfXyA0ZlQZs=;
        b=IERUB7BbyeLTIt9uiKPjaN6daL9F+DRJCVpFi6aDqPw0zTyo7mbKN694VXGAjMlevs
         vmIiJzU5+AhYt2YqwpZm9aG6vvFq0n4X90FiiQfmtQijc31NLLmk8/WqgbLgLBitOb8d
         VaLoXPCCLbbO/zdyXwEvlFstGAWdxcCU2duwM4mWYS7TJqL+DSMtbbrgfk2+s0n6VBQH
         0zQlPO8CUtehXykHA7hhZXmdPaQbZOYXJoKRwsrKbwqZJSodfaRmvMexdYgvjeeL0cFh
         /sDcRrnpFvq899sNC+YtSx7D5TBR0PQVBD9SA3+c62fKBR/AMAx6OyYktrjINHFjBcaK
         9Wog==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792050580; x=1792655380; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bn76A1L1zSnfTuyCF8XnV2/uvU4lFD6V/f9S5z9LEdU=;
        b=c7+8pm8o2dt97nyyknEHSclEP5QdJ2xIDtWLKUjmGuHQjogEAgxMNqYoFupfDnZe3h
         +cKKlswxEEhPuLHu+OC6oqCoaf+4Sb6X11228Lb7gQ2JR6QTQ0965IN4RseOFyqSTPTV
         sBtE22QZ8zFzHxo3Ubo0WhJGb1iLas44c4w2OcdcSsPNrj0Eylu7l6bPIdF6+JAIFIcr
         xeKbk3aMDmBQ+UcJbUS3PgTJkKtiWhHEzT7TptH2EJ9p6Y8fhfB6JQXUsOVRnTz2imHw
         dRZkX1KN0YDAAFSaHnOBpL5Ecp31Eakvx2amdl3gxQ4hNnnLUJCluMGZCbrUa1smM4vA
         7InA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792050580; x=1792655380;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bn76A1L1zSnfTuyCF8XnV2/uvU4lFD6V/f9S5z9LEdU=;
        b=2KMJNUbpG+jmaSjnI4WQv5M9HE6e3y9q+0mFnG1oDgS8bAE1Mby6XiceEGCk3pn+cC
         ZHnQYr2KLsksEqboFUHoFEglsi7H/qGpxJB9zf2BFzulOIep+TSEC9/fxzPPLXlnryQh
         h6GIDPRCUD+/b8mogo9232QJH2xyzLjywpkV07Hq/TnAAUkq6HWiPEYD0rhVijgaYUzj
         lpu6gZCDoH79pxQZZmxNfUVlDRHWrlnRc3oXmPfUkth/fHTJi2w+3u7i70/afPEtMR77
         4OVsrjWSHAbuUsiyGMTbBv38ZrevlBgqcOoXQXIlIc6usCFulQiaIL950crBadZqGIHY
         SiXQ==
X-Forwarded-Encrypted: i=1; AKwUvBxy0qkZ18dMRuuWgf20nGqjAzB2MDRR4VbMQXS7wCXeSz9nE+aV9R+OaLTBGv1WspSeP+c=@lists.linux.dev
X-Gm-Message-State: AFq9FYIymlI1nfHf2cFREdEsgII1SDz9AAva7puy4fLaQXC7seaQJK2O
	pS4iHENpkrJbGz9lDljaczobWwyRkf6H0XqnkVGvI/Mr+zmUmficAsrtuojgzdT4dgi4R/R6rwt
	iJo/vKVFMKmQJsMl67VIYPS4TBRaeOWc=
X-Gm-Gg: AYBFou2s6avaXEv1Yjslb+Zv9531g3YCJsWqA5xmeiIwlcB7h5KOPJGWIx6GqanuO4D
	tQsT+6Mcu85C43XJiJse4zccWnzgF+Ps5/z22sBQuqxIj8fGG37TBaQmRE1Wyt89AVWId855JdB
	BLX4VskcKSEoTstgXnBUpnOkE91CK1uqvAEzc2Et8gWZ1GbKHTyDDgZoHtBZSSXaW5ZLs6sXWXA
	lmLtBf7Li3UG+0nZEfutnvJy65h/vYhzS+tNEpPX/2nLR0ejsepzJVq5B+AzygWPSt+yk8/KBzl
	jcyd1haWMYxSI+EdlgZaHLA6cu+BSmUkjRAPNe0NU/e6G6nFu8CVv1eVCzMG9RgTdYY6AnkfDlH
	F8l8uaCMPU/LZ
X-Received: by 2002:a05:693c:80c5:b0:35f:6d9d:af68 with SMTP id
 5a478bee46e88-35f6d9db757mr1154283eec.23.1792050579562; Thu, 15 Oct 2026
 00:49:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261013173504.451391-1-clamor95@gmail.com> <20261013173504.451391-7-clamor95@gmail.com>
 <f5d367e3847da2f3d3db0abd0a099920@gmail.com>
In-Reply-To: <f5d367e3847da2f3d3db0abd0a099920@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 15 Oct 2026 10:49:28 +0300
X-Gm-Features: AclHuK_Oo9j5QRqhps9x8wmywtw4oQlKiNMQc_P7VxvfWQOhI0DwxVL2kvoPOvI
Message-ID: <CAPVz0n1YcHwH7b8kg82Gfh7GaT=O9Sx0YEhx9jAGkZ=C1JV_JA@mail.gmail.com>
Subject: Re: [PATCH v11 6/7] power: supply: Add driver for ASUS Transformer battery
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Ion Agorria <ion@agorria.com>, 
	=?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	Florian Krischer <florian.krischer@fkr.dev>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
	mfd@lists.linux.dev, linux-leds@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 15 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 04:3=
8 Dmitry Torokhov <dmitry.torokhov@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi Svyatoslav,
>
> On Tue, Oct 13, 2026 at 08:35:02PM +0300, Svyatoslav Ryhel wrote:
> > +static int asus_ec_battery_get_property(struct power_supply *psy,
> > +                                     enum power_supply_property psp,
> > +                                     union power_supply_propval *val)
> > +{
> > +     struct asus_ec_battery_data *priv =3D power_supply_get_drvdata(ps=
y);
> > +     int ret;
> > +
> > +     switch (psp) {
> > +     case POWER_SUPPLY_PROP_PRESENT:
> > +             val->intval =3D 1;
> > +             break;
> > +
> > +     default:
> > +             ret =3D asus_ec_battery_get_value(priv, psp);
> > +             if (ret < 0)
> > +                     return ret;
> > +
> > +             val->intval =3D (s16)ret;
> > +
> > +             switch (psp) {
> ...
> > +             case POWER_SUPPLY_PROP_TIME_TO_EMPTY_NOW:
> > +             case POWER_SUPPLY_PROP_TIME_TO_FULL_NOW:
> > +                     val->intval *=3D 60;
> > +                     break;
>
> asus_ec_battery_get_value() returns a u16 (via get_unaligned_le16()), and
> unconditionally casting it with (s16)ret sign-extends unsigned 16-bit
> properties >=3D 0x8000 into negative values.
>
> In particular, when the battery is not discharging or not charging,
> TIME_TO_EMPTY_NOW / TIME_TO_FULL_NOW report 0xffff, which (s16)ret turns
> into -1 and then -60 seconds instead of an unsigned value (or -ENODATA).
> Should only signed properties (like POWER_SUPPLY_PROP_CURRENT_NOW) be cas=
t
> to s16?
>
> Thanks.
>

You have a point. I assume that using val->intval =3D ret * 60 should be
acceptable.

> --
> Dmitry
