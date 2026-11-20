Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795164330;
	b=UGp1h+dOH+zZBadhmZuD1kygWLq5Nv3L9JTLl3lw62ZHFLzo6S2knO7S6itQceitKMeT
	 4uDvfvvVfBK9npII5SERJgrgn7r9M5kmoZx6gOth02U6BGM1ZMn5wCIGCAGHSUZ2kucpZ
	 BfcXUbIKrj7aTKN9OFx+4XUxBD13HjPBaUZw0jm52rZ45HiLk9bQK3H0C7VqJ0uQfnUOE
	 9qGJyaleb7S6QYRkUANACuslZfu0Us4uDSRbX84fO1yHTWsYNd7QdrqnqYwb3tYPvy8p2
	 GtRt3vmoeCySOGje/wrnweN17fZamzPuFNM1Mffab8/Q9w0iY1uaJxtZYlIwR7+N0JQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795164330;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=kKe/4cMcpovlVlLqvT7qtlmn5xNAbW7n/dTNm3KFNs8=;
	b=1zSSvXsmXK6EIdm8ONQj/6tLkSHPqfDqU4ZNPU8cv1pjxbwUrlndEfb+rHmAl0yJJD/h
	 /4/8nCbyOmVV71AFNzGv3jO5woBmXrVRwIw50OpdVYjQBplmPXWCr7Ks48V208MTSmRlp
	 OHDuFLd5L2Eu4WwVX2fAVeByEeQ1GNCLTSb0gM6rWVj0wo5bvg6dV9Cv/7D7TCK+3Aqs/
	 hrAndmai+uJskTH2N/3N3sjhEPuwKkJYuveskh5dApndDE2LghXLv5DLFBDD3Sq2jsHzU
	 mUGfpObQ0srBVOXtZkQnxHjopZQoKB43qYQM8W0oq8zr/8ZHCDTUBpC26rnkuENEiSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.174
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14CB0606B4A7
	for <mfd@lists.linux.dev>; Fri, 20 Nov 2026 08:45:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14CB0606B4A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5eaabf28c06so446740e0c.2
        for <mfd@lists.linux.dev>; Fri, 20 Nov 2026 00:45:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795164329; x=1795769129;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kKe/4cMcpovlVlLqvT7qtlmn5xNAbW7n/dTNm3KFNs8=;
        b=VsANpottVKrpAG5XcNY0jGcCAn+NH9gPp4rOnD8IwDLw/JIybK582dNoMt/S2vdbt6
         X9cY5RnA7o4dseZoyR8V2NmZuCclV3MzpoAKaBzomRIqldpOG7GQoKGerp19tCkcmVqA
         4JkbMnJ3NJe2GjOSrGmLP53fSlemiZds0KuDUZx9DA/b3LWPA3D5J+rkFICr/4sDu1GC
         0LV2jr6nytQyfT2XNw4jk1qJ0xukIUZjzp2m5u7eAhuiXClUATigRNNy5+d/Lqd75SYx
         ir8ZTi0XC0hlbMu1okqy/hUdI89wYurN63XeOCW03wha/Qp9AAFOF4MuDcpMg7Y/S2b0
         BNmw==
X-Forwarded-Encrypted: i=1; AL+hErFLsFbrembDaw6jrBns5a/Wf97vhs5RIEBlimkmoOpPh4V6qhWLJa+D2EWevp4vCgBajKQ=@lists.linux.dev
X-Gm-Message-State: APuU4Z+9tf4C4uZZcgNJWORpZLNTr5RkmbySqm2P4Hjxr3fGngtAMI9s
	71/DNR8sUSjE/1cfqkeCt/zbGReHz8AZ0kwTs0mPno+DqnJ3k5hwTFW38CPZiArn
X-Gm-Gg: AZFdTZf1lKWYcc3WxCJMSsEPpS1gS5/8xZze/fl5ho1ss6eaPdBe90dJV483pYHnZP3
	NBi5DfRab/Sl9xF/JbU9q+sf+7bXNeBAcEcgqno25lg4gepfxC/iRFHGc3UM+2LsNkNDe4oP1Yb
	evH+EWoHk2O7ByKyrX2IlxYZUnDd3zWgY2d49JwP9ZzkydF5uQtaDbUjwEIK8WWbvy6hANjV1Bj
	z0WYZQ60EL5gaIstMqOlJLqIbB/uoDc3MtRGT21qvPoSwIleCSqnERhp9jkWvxrG5cm8XtPTORj
	1T2ucWi7t1FhcU7NbbD8ZgdJoP768xt2iB+y073Tq1Da+INVhTg/jxpPxva8ePmGP9OWuVw9nwv
	PQyalOkVRKzqF1w6TmsxzComzNSr+tOrd/h/2gBjs1seZtwvaLhhzHiHdDKWReBS6z9dYTgaa4s
	aqW5Ue9CNSxAcg9zWy0jHy7msXecJkCCStNT2LG8376PtrYcEhL//7ijbEPeKDII/fvMlDfTBA3
	IyibF6dyf6a7CsORYGooQUIh0HqoZ5SfFCvHm0Sp+MO46CWisXCD6me/5gbbgKbEmSi/JuJ9Acz
	t/iMJLl9sdIN7UQvd3HtOVVYLHZWh/bS4YM/hX+suR9ugqth3OHue7FYo66rVtGENG4=
X-Received: by 2002:a05:6102:a205:10b0:7cc:24e1:77b with SMTP id ada2fe7eead31-7d72b36270fmr780067137.4.1795164328981;
        Fri, 20 Nov 2026 00:45:28 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e6df8a28dsm2398563241.4.2026.11.20.00.45.28
        for <mfd@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 00:45:28 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-98fea7e52b7so446284241.0
        for <mfd@lists.linux.dev>; Fri, 20 Nov 2026 00:45:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHacmpVmpORV/HFOucQ8Q+EIc/jhtREv1XdeM4hZKtjzDCI7feG+BzWmKbXGdh9tHwxAUA=@lists.linux.dev
X-Received: by 2002:a05:6102:6a83:b0:7cc:2c52:47aa with SMTP id
 ada2fe7eead31-7d71e35b5demr961144137.0.1795164327788; Fri, 20 Nov 2026
 00:45:27 -0800 (PST)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <cover.1795095742.git.geert+renesas@glider.be> <CAPVz0n1+qXrO5P+rOBKOSOE86+WcmjNF0taWDZoWqerKrjVgJQ@mail.gmail.com>
In-Reply-To: <CAPVz0n1+qXrO5P+rOBKOSOE86+WcmjNF0taWDZoWqerKrjVgJQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Nov 2026 09:45:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWPvKop0KAg_nff29ZeAELKprfmDtp8hDU2KPvJH5VVMQ@mail.gmail.com>
X-Gm-Features: Aa3M54rOiSTOIwRhd7pOhxBlMhXD66QjrOqwvbGtlwpHt8JjwbFg6d-mZpwSDxY
Message-ID: <CAMuHMdWPvKop0KAg_nff29ZeAELKprfmDtp8hDU2KPvJH5VVMQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] Improve MFD_ASUS_TRANSFORMER_EC dependencies
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	Ion Agorria <ion@agorria.com>, Lee Jones <lee@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Sebastian Reichel <sre@kernel.org>, mfd@lists.linux.dev, 
	linux-input@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Svyastoslav,

On Thu, 19 Nov 2026 at 15:51, Svyatoslav Ryhel <clamor95@gmail.com> wrote:
> =D1=87=D1=82, 19 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 15=
:52 Geert Uytterhoeven <geert+renesas@glider.be> =D0=BF=D0=B8=D1=88=D0=B5:
> > This patch series improves dependencies for the MFD_ASUS_TRANSFORMER_EC
> > MFD driver and its various subdrivers:
> >   - The first patch adds a missing dependency for the MFD driver,
> >   - The other patches enable compile-testing for the input, serio, and
> >     battery subdrivers.
> >
> > Note that compile-testing cannot be enabled for the LED and charger
> > subdrivers, as they have a hard dependency on the MFD driver.
> >
> > Thanks for your comments!
> >
> > Geert Uytterhoeven (4):
> >   mfd: MFD_ASUS_TRANSFORMER_EC should depend on ARCH_TEGRA
>
> Though this EC is designed for Tegra based devices, it does not have
> any Tegra specific parts. It can be used by any other SoC.

Sure, the dependency can be extended once the hardware appears in
devices with other SoCs.  The question to ask is: does it make sense to
ask about this driver when configuring a kernel for e.g PA-RISC or S390?

> >   input: keyboard: Enable compile-testing for
> >     KEYBOARD_ASUS_TRANSFORMER_EC
> >   input: serio: Enable compile-testing for SERIO_ASUS_TRANSFORMER_EC
> >   power: supply: Enable compile-testing for BATTERY_ASUS_TRANSFORMER_EC

As pointed out by Sashiko, I forgot to take into account the transitive
dependency on I2C, so there will be a v2.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
