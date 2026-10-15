Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1A6457E4C
	for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 18:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792089707; cv=pass; b=TXjJJIwm53RU9B0s30BtU1977yZT8aXRllfZP2zpdnWVgTx8nBQlQxw/xqrwxMWboX7KgGzWxDaQGe9+S43e5llT8TiZA3O9ZO5f8k2VPZ2gZbEZVKTCRws/TTPVov4lYqflK2Iu98HbfFFjYSofz79Z0kn2ANw0m8MKshnqGGY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792089707; c=relaxed/simple;
	bh=xauoRU92rayWXBiUnhY4lqEI/RzVYWTkJ5X0x3hjblE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kQW1gZbISfsF+zlNuqZec9P57ZpOdUSIoJRA7SbmHsK2Z/z3SIKkzh8UP0P5bxBAlDo/4yn8oRlpilNGUUR6H1O/P6Vcc3eZcotm4HPcnDjU8Q8zKVEF2pFv/K5ljrcPxqwJOuhutzK2He3/Ic/YdfWWq/G/O1q/I0HhhLfRdj4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RBfm1Xr9; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RBfm1Xr9"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso6913584eec.1
        for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 11:41:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792089704; cv=none;
        d=google.com; s=arc-20260327;
        b=imdXYdLrB6b3tlxrrgvC3JRgfEoN1wS0WtqAlJFsGDE3ttWya6XzkjNliD4+DfYwXC
         kZ71cvY2UWesyYooMy93uHQZMnnUFD6qIFE3sFA/CjhXGpo9MDvOnC+HtPxHay98nVZV
         kRG0cjMzPyq5k2JG+mnxugZDG9R8QSzMxSfF8Ep7JZbK0QNcsV9gAkPjpFuUwNUZsyWx
         e8JGR04Mad7uM6vrXHVXGysJDfQhJMLfYAGQa3qPxwAf54Nb1UXdDhXNXQh/2TBas7q9
         vReNRlrAapZDqchxM5GEFEmRfgU1TJkrjOwuVk2PcObQsLRVXSbYl/SmXwK/NvVClLXQ
         5xag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rsIPZgYgrzIClGBhGTKauA1e1WQnsO82rJ+gDiB7nEg=;
        fh=1gSbA9KnKbyynQh7Lg+JdKsEkRPoTE6QrF/RU/da4wg=;
        b=OZ8cUOcnXA6QOspx91oBZ4cZLHYNc0WXaUUVTETOiXCojEY1kk0aF3bpF+tkdw/sCG
         KV76SjCrq57m3wDIVfmuJVg5kAH6mN00qZ3F2lo4Nd1ITdv6hRHnwyZZqrMvSWX4Tjsd
         vySNkm/X6fsPeGbeTqn99+4ZlinA35J1MxeeDlM/1HPzxsKqhOVd+Lf71gdxNhrfuFNS
         0DNJ19R3BCAY1JLvw+wCZFLoqOy8SGu2gpezpTOmzSxaCOA24IVUboWjmWZGF2HaoF+N
         CWeDaqQHvTZeqMMuOZf0XDikbqZzFtUhAomQLD98P+7PjniDAH4LOhmbbbxHQ37PPhPD
         J1/g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792089704; x=1792694504; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rsIPZgYgrzIClGBhGTKauA1e1WQnsO82rJ+gDiB7nEg=;
        b=RBfm1Xr9+VPSgubFY0nMKe9GLmreEa7ySlScBNU/vIB9Tx4GjMRSnSOXtR0kA9JHrg
         tg9lyIHxaDIlda22+Hjl/hsqx9wB1zj4A7Bd2Vs1s+IHQtT3Lx3Ho9BT8PgR1K3QqJpO
         uf21coiBN0CU7tZY2twAfsMo8PUZpCpUWXLPAs/2BZz1aYEFaao5pny1TabCFmz0pe44
         PMtZMF9Z/lo0yikwFgBplcM8MN0FaRIaHq31IUWETuQD5W0+9M2cIaBlRZ3CQ50B0LUX
         OjsY3xHI9cBZizNe3BII7n/hJBJn8Hu8WdGIbGbcJJ3vvjSTskbuj5/ILXXi+qxENvuu
         jTfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792089704; x=1792694504;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rsIPZgYgrzIClGBhGTKauA1e1WQnsO82rJ+gDiB7nEg=;
        b=FXdaNiRsgk45oJKqa0RiuUVjRYni+YK5iGtCudj4u2U7n2jp92nER1btRoip0NrwxE
         PZhLp5RMiH0G0Tka8rO9UQ5u9PGxx+fC2a5ORVDRv3+Znc08kRZcgwzayNI4shefI9zu
         aPTPwyALRrF6tbha7SdEuisuWFzewEe6rCxXhyzpwz+6ixeC7rf2duqFSu8iwPH33Ikc
         rMSrsgKxAxBeLJxkJ+Dt0ax+yf379Lgcw+l9w3gkG0zXKlo12wbnNU9624FY8RXlhuIS
         XTiRfw8t/ZayjypIPaJ2PkCDMee98UGWGi0nCHxbRdr/5ilDu8hBGE/7u1bPJNpdQWey
         MSAg==
X-Forwarded-Encrypted: i=1; AKwUvBxM5C8ldvL2RTMJ2SaO36vDDxuDNQjMLpXm+q0Wx0LOT5ubOa+ukDLYoVWI8xsEPUCcCUA=@lists.linux.dev
X-Gm-Message-State: AFq9FYKCZ7fSlIUZgpFs3G+nT1RafqnczEFB4bOUmU86LCW9cdH9FrHL
	kgnrVXLE2zf8SaWYAlFY+7a6SYvR4XUHYhBQ0d7M6mt8SBXhlH2cI9WzcVlVn4viVBtSniN7jIT
	GLvgBYJwvS7Nxzs+J3KSfgwHAwpkNY7I=
X-Gm-Gg: AYBFou0FT57v9bbXiH7a106jwF819K7UGAPHQwbC3MQnOQraoVF3ITLuIiFc3zBiO6b
	074yhu3HA6CsaYt/RC/HwKNeIvqZ3enpd+ksLeiis1GG+/P/N133XxKS4byjxHNH6MSaJGX8dTs
	j/AMp1So4Xet24tCSG7w0P/74PLFIkr9GhcKzdNxYfYnqD7CdgK8m6d0u4+KljlajqiEbcDdlEH
	08vn42vu/z5PF7RA9lAYpRVBMYJ+wyb2WFRuNkRg9lDffEog+06qUflFRy3ba5iqAh5A0LRij0b
	DDD5d/HzMdzcOHyx3nNDnpvk89xImbtXP40FYmq6GPYAeBol0q8r70BL3RAAHu0mX+CvbngPZtV
	xjrj0Bw9pTVwO
X-Received: by 2002:a05:693c:2a12:b0:35d:2c2b:215a with SMTP id
 5a478bee46e88-35d2c2b2220mr10102451eec.35.1792089703889; Thu, 15 Oct 2026
 11:41:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261013173504.451391-7-clamor95@gmail.com> <f26b6bba-2c2e-46b3-9350-0ba0785cf3ba@web.de>
In-Reply-To: <f26b6bba-2c2e-46b3-9350-0ba0785cf3ba@web.de>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 15 Oct 2026 21:41:31 +0300
X-Gm-Features: AclHuK-9dwgzuV_rOZ05ZsN-0-b2YgDg6QoraK02oNxRoGvJeYL0q4NRa-SbCE4
Message-ID: <CAPVz0n2ubBgOGO5q4ZBYkw-eDSuNh-MpdBk7uoWW69m2QduSgQ@mail.gmail.com>
Subject: Re: [PATCH v11 6/7] power: supply: Add driver for ASUS Transformer battery
To: Markus Elfring <Markus.Elfring@web.de>
Cc: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	linux-pm@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev, 
	Conor Dooley <conor+dt@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Florian Krischer <florian.krischer@fkr.dev>, Ion Agorria <ion@agorria.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Rob Herring <robh@kernel.org>, Sebastian Reichel <sre@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 15 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 21:0=
6 Markus Elfring <Markus.Elfring@web.de> =D0=BF=D0=B8=D1=88=D0=B5:
>
> =E2=80=A6
> > +++ b/drivers/power/supply/asus-transformer-ec-battery.c
> > @@ -0,0 +1,289 @@
> =E2=80=A6
> > +static const unsigned int asus_ec_battery_prop_offs[] =3D {
> > +     [POWER_SUPPLY_PROP_STATUS] =3D 1,
> =E2=80=A6
> > +};
> > +
> > +static int asus_ec_battery_get_value(struct asus_ec_battery_data *priv=
,
> > +                                  enum power_supply_property psp)
> > +{
> > +     int ret, offs;
> =E2=80=A6
>
> The referenced array provides unsigned integers.
> Would you like to specify a more appropriate data type for the correspond=
ing variable?
>

This is a nitpick, it does not affect anything.

> Regards,
> Markus
