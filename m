Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795188815;
	b=s9uLFTFD1I7QdgTVygi1flTf0sIfB5j1woLe1OcjbDngIhByktOD8VImoJR7mnk19kR0
	 yeGqu1f6OE314U8OUz7jW39LtKZXNq6QciWoIHYN4Ed106dbuZeQbcqw6WQFPFoifOmWq
	 q72kgAI5rV6J139pVLJBvLx8MQPQOAt7rqEHAbPfF+XDTNEAGqEYJWWyYptJV6AJ3+dlZ
	 vZcl7a7ByOnlibgBlxsq0AAXYm7jDN4pCja+qtlREdRVibWdnGT2uHZNOCCAKw/il946b
	 SVcg+KBnoUo4vJKHsh8s4ZqyqPmnhvcp/IGwwRYBPxPJfjc+Rk9+4LZd+q3k2gKdNVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795188815;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=cn3lpGNrKpPmr2WW+2DRITn4KazHE8yVcfU/4bT7oXM=;
	b=AIQdVTZes28uqkwqCg36CZEFsA/9qwzy1VuBXqjhYhSHg4CSJN8nEMtNxOUp/Da/m4xG
	 750yckcO6hQvxYIhCCqj1lBJnj+rhlpo5PHvpgs/+Houi9JJzVL8B3HO0EmVeynz7WPAa
	 pYoh424bVLu1+AIffKOMXplv470yU+6Qmh9G0vcAcymG7V21uZ2VCRQEryp/c6IUfZvwl
	 2IoCI06dK8CBbndZgD5R5baqHeg08pw0ZeFjKRsdQNRQTmjp9W/KzlbdINdypp3fLmGsc
	 MPJiUEofGuDA4Ai6F/JTUvm4vlo0oSn93g5gvjsH2AmDiwnpG/YVznh80epzCEGN5eQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586A8606A32C
	for <mfd@lists.linux.dev>; Fri, 20 Nov 2026 15:33:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 586A8606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8b0d126f631so8208837b3.2
        for <mfd@lists.linux.dev>; Fri, 20 Nov 2026 07:33:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795188814; x=1795793614;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cn3lpGNrKpPmr2WW+2DRITn4KazHE8yVcfU/4bT7oXM=;
        b=e6V0unLv1+5MINDwhPBCh6n75S4YDxt0mITE1zZ59zIRlVItAsYAXXAXc48ewRYurs
         UTlBRFbDA6llqwk7C24sTveNRDRUjqOCEU7KItxg3PK0Qhyd5diqCFyPGsR5IFbvpK26
         QZUaPw/8daG+AbpWV76edjv91ZdfQh7FVYKixE/P3h6y640cIwF4dQ+CMw5F6hFZXaO6
         0CgxovtWAl2C7hvmQSwfzOyktIj3i8phlJxN8RKN1wtVYJeD1Hvpdbr/5OrqyHk5ooBX
         Z2ga46Gh5M/T0t292tPOBuuCcrSKuVX53QB8LOpB21Va7DrWPYKGvW1IAld6PiO0EOMh
         CycA==
X-Forwarded-Encrypted: i=1; AL+hErG17l+ozNkLV61UWniXi8D54yDaqdcmYutkiTn0zCG8ppRwgmM3TLhyBuZs6Dvgq26IY1g=@lists.linux.dev
X-Gm-Message-State: APuU4Z90+fayiIF1r3WqI5p6J8jHjt9qybKPzG5r3EKziivgQZIha0/N
	7dEhS+tvAfOCOxZawDuVD48AA/Pt71kLgtp3NyY/MblNBR422WxkrxFMt1zHBZvZ
X-Gm-Gg: AZFdTZdrCV/D89BnBE+nZFzMxtMqJt6siEgePsk33PRDcsgZ8QPJ+ehULVLcwag6/f7
	WdrIu3Ccj8OhEzc/P9fB7P5w7Q3zTfZLv61FCsSdJw/Tq2AapBTtPXjulGqSagOvIerw7Nd7qr0
	ovKHbXbu5oU2LTJtwBAPotsV8ZjJ39VmHgjWpiO3x8iL47r7vPzc6LHcjTAWJmmcEksgZ5hj/lm
	R0cxv3gBV9fi4aOEJXS5ktK3Dm1zotUXLXpH9h60xBDf4n0LxhPcKpXbY8eFkB1RX2P7NSAj7JR
	hztoozdgkk/x5w5UdDhatVhhfFG8RzewaUjjva626NTZxEiwfWSAEO+wYSjjyBRxmDIytqVHAEi
	y5iwmxTXWjg08ZkvvWWoXOehehJXTJ5J9VbqXdaZAG4IDSnca6/4GfUVwd6ZwN68W9/mduen5hl
	b66QTswsyrewt2pHgXA50d1nI9sSjzJV7XoYHv0vyThqH+lyBy4lxgyNMtYL+p5e9FECRiLk9D8
	G2m6M7MMlTXDV50LsqD7OcsyjjlrjHS0nbq+LDbQD2Q4ttrsNSfrdLbXDEYYB5S8TossPcTKUPY
	KKb3CeA8ixTpVI+1jnsafrAWA1NlDF3LskZaLuzH9tIUwf0olyt6oynr8+fgRkExp7w=
X-Received: by 2002:a05:690c:308a:b0:8b4:c545:7cd4 with SMTP id 00721157ae682-8b52051b1a0mr15691197b3.66.1795188814194;
        Fri, 20 Nov 2026 07:33:34 -0800 (PST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b52028d89csm14627687b3.15.2026.11.20.07.33.33
        for <mfd@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 07:33:33 -0800 (PST)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-7d2dbc0a8d4so346483137.1
        for <mfd@lists.linux.dev>; Fri, 20 Nov 2026 07:33:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHjeQmu3CxXXCw3ifBgvdbLzCX4euB5S34OH1+LgYV5tT8ftLuckYbrCCQB07S9WFDkWxA=@lists.linux.dev
X-Received: by 2002:a05:6102:3f16:b0:7c0:1d48:b2a2 with SMTP id
 ada2fe7eead31-7d73968c860mr1362556137.31.1795188813290; Fri, 20 Nov 2026
 07:33:33 -0800 (PST)
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
 <CAMuHMdWPvKop0KAg_nff29ZeAELKprfmDtp8hDU2KPvJH5VVMQ@mail.gmail.com> <CAPVz0n3zsUixggHgKNzWsxtxDZ20GecHGa7qQf2RmzkoJ792KA@mail.gmail.com>
In-Reply-To: <CAPVz0n3zsUixggHgKNzWsxtxDZ20GecHGa7qQf2RmzkoJ792KA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Nov 2026 16:33:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUOtO6XNw1MKW5CBi9MSK+5TxVJhf_4nOt=Zr=qordTJQ@mail.gmail.com>
X-Gm-Features: Aa3M54ph5eK70EiMju3R-mcxt-wZED0VO-z7mXKruy6-8v4cTNmqw-8EZNTAXM8
Message-ID: <CAMuHMdUOtO6XNw1MKW5CBi9MSK+5TxVJhf_4nOt=Zr=qordTJQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] Improve MFD_ASUS_TRANSFORMER_EC dependencies
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	Ion Agorria <ion@agorria.com>, Lee Jones <lee@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Sebastian Reichel <sre@kernel.org>, mfd@lists.linux.dev, 
	linux-input@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Svyatoslav,

On Fri, 20 Nov 2026 at 16:15, Svyatoslav Ryhel <clamor95@gmail.com> wrote:
> =D0=BF=D1=82, 20 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 10=
:45 Geert Uytterhoeven <geert@linux-m68k.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > On Thu, 19 Nov 2026 at 15:51, Svyatoslav Ryhel <clamor95@gmail.com> wro=
te:
> > > =D1=87=D1=82, 19 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=
=BE 15:52 Geert Uytterhoeven <geert+renesas@glider.be> =D0=BF=D0=B8=D1=88=
=D0=B5:
> > > > This patch series improves dependencies for the MFD_ASUS_TRANSFORME=
R_EC
> > > > MFD driver and its various subdrivers:
> > > >   - The first patch adds a missing dependency for the MFD driver,
> > > >   - The other patches enable compile-testing for the input, serio, =
and
> > > >     battery subdrivers.
> > > >
> > > > Note that compile-testing cannot be enabled for the LED and charger
> > > > subdrivers, as they have a hard dependency on the MFD driver.
> > > >
> > > > Thanks for your comments!
> > > >
> > > > Geert Uytterhoeven (4):
> > > >   mfd: MFD_ASUS_TRANSFORMER_EC should depend on ARCH_TEGRA
> > >
> > > Though this EC is designed for Tegra based devices, it does not have
> > > any Tegra specific parts. It can be used by any other SoC.
> >
> > Sure, the dependency can be extended once the hardware appears in
> > devices with other SoCs.  The question to ask is: does it make sense to
> > ask about this driver when configuring a kernel for e.g PA-RISC or S390=
?
>
> Restricting this device to Tegra, even though it is not part of the
> Tegra SoC or Tegra-specific, seems plain wrong. If you want to

The help text explicitly mentions Tegra-based tablets.

> restrict it by architecture, restrict it to arm/arm64 instead. Your
> logic is strange.

Sorry for my bad wording, PA-RISC or S390 were just examples.
Does it make sense to ask this question when configuring a kernel for
an Apple ARM machine? Linus Torvalds does't like irrelevant questions
popping up, so let's wait until he starts complaining?

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
