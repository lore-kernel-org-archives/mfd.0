Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792565202;
	b=qju3ANYxezD6DVQ6u1c/g5P0ZDmfmYgQDCA3E4NonI6VhiClV2Z12Ncm9cafe2qr7reU
	 JtBxmzTdudPbRJn/OfCPlgaq2xSzn34HMVULn52jLAx0gpT50tju2zeLceZqUamAQlNn2
	 u+54gVWgxXjvkb/a+cRnUv54lm6JkR2ZZGbqisXoKSS6t9//CsMODk2cvbJOu/Dqw3vwH
	 bnbqMix39cbQEU0ZmzVUtVIY/thpz7FTZKx5U0Ut9xdCvy7HUZPugtkntF13O2QOt6k6r
	 a6FSwehM35oqXBYwu1NdS4tdGcAvRofh9wD5G0JGLQ13nAeFh8unr97DWsX6qP6Xz2w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792565202;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=MFx6RfKZoDg30I8aWbaaH8/QBhrTkiLCB5URy2j6R9Y=;
	b=KMvBGI+W5KCJGLNyL9IjX8CY4HBwB0mvU9NPbpOPKSUctt3sHMH2N7ddlnIMmygMOu/7
	 YiPp5ch2Ff4aX3pyQ141dw5+rz5pswPbkPXOANm5qYfoWn0wnljJJVa9kC4GKEcpS/VwH
	 ahk3o4AGAtKriN/PzyZV6og52GGgEVMvAtTPVueIBhdLTY16YyKIGr6GlYcGM0OGgvI6i
	 0E6WfMeEyQAQQYulnQLplSzjGMEOvqUrTeXbU/eLquJrQMxn+KAYH9xgQ92ViJSgz0rsh
	 iz7t4nHkqfFiBxGUSlN0SkUX2KVj8UJofXwvJG1awB+31rws2TN7EmbS0aeQ6fyTzNg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="Qvu/VZfA";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61F1606A31E
	for <mfd@lists.linux.dev>; Wed, 21 Oct 2026 06:46:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C61F1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Qvu/VZfA
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36661f953e4so777331eec.1
        for <mfd@lists.linux.dev>; Tue, 20 Oct 2026 23:46:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792565201; cv=none;
        d=google.com; s=arc-20260327;
        b=agJhid+rBbRondCMsZYQF0isT5+H/1jRKKMdu7V4Q3NPJrnZFrC0Ja5njHbUFA2hrn
         jhLYwTTHYDe5x3LGKHWDzfXLuGcb50X8/wwXN/ZrxiBKAQIVpQL2UXFrTdoswM4H1Ihq
         D20aWWEptZ5Yfxte/xUaDW3UAheLVvCKlR0OzwirP+pp6DVUtliI7sQ+IyGSoiE+EKKY
         3KKj6DV8CQVD7AVg0RkhMzdIITwVeXuwuvO8tgTBMpE8H7T4hPketNZVeZczKCJS7Kra
         kH0G0CtRGgjZhHRJLjq8M8yIAQMu7je/bKz6H6YSQuB0VU6PpLmPRpr47oN6Kwh5+Vyl
         649g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MFx6RfKZoDg30I8aWbaaH8/QBhrTkiLCB5URy2j6R9Y=;
        fh=ssh5jSfyarajDtuvS/uwZiof1a6kpfRaC3qK6ZNRjeQ=;
        b=YhdQM+PH/E0YqnU0tP53nnLBL7ayDk9UYasHe/eN6aw1y9rngtFA3RYVbnHJPRSkNH
         5XMoJzc+DRxZPXnMbkFQ0mual+QaFhbL+mIToRkZYyzHnfDHC65Gl0ub2TnE/qii2O33
         wGqnVRxaPP+lbyrjDtyMBvGllHbeqzpJA6cHTZnZEzHoVKOkJQ5btxe5RMJiMrZMY+tr
         Zn0Wf9x6IS14FrklIDkyXlLN+QanEdp2fD6ggEdDh64KUCmAHsfLhP8hgML1+OgG7iDH
         wiJcQ6XvWxskHWOkw8yeykNZFqp5/HQg70vClmzmGmekEi3vEaQ8AcDVkth5bXDwgAvH
         MX/g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792565201; x=1793170001; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MFx6RfKZoDg30I8aWbaaH8/QBhrTkiLCB5URy2j6R9Y=;
        b=Qvu/VZfADVYGqVdVXSpajES235fgs7GHjNAvBMlxeR4MK25d2GiYzQpbPWUAI73OkR
         WxqBhlL2JA/RGbZV+YL5TYctJV24AmZ/R1F1QyY6s6GzMLNPETo2f5EK9jHhxseHbpMV
         3fSNYqsfztzWzNOw3+rn5GXOgbREEiNG55pHJUMm7VUxqEKjOZY8kCYkqHspHcKiRSIY
         MsD8JXzaq1bQHKSi1Zp4nH60yVjnFBouZ+2qawe+3VgHqK6XErAcPnBtIn1ELfFG0qr1
         gStmcpE6g/yNihfEkvXMpuXCCO3DDZ937Q5CPHfSxvOhd5lU1lseUsvh2SPT4UUInpMU
         o3gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792565201; x=1793170001;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MFx6RfKZoDg30I8aWbaaH8/QBhrTkiLCB5URy2j6R9Y=;
        b=neQ+UHNfd5003T4oQjFeQQJi7JH/xDFZs3r57tCrU6xQ3MBLr0fwN2pv5AclxgJ4SU
         CU15gfJd/C11GA6sIT459f6k5TDaBfcYo9cGdDl1qsMUnonIcZp2GsfmKnFxTt1xanY8
         67wjKyqtOH2hwsBoKlspFTGG0u6Bhmk9G3WzkmGGnEq5o+UZPF/399Fy34OKVMx0ymvO
         c+TGz9x5QyiQIpjz9qpkhaX63MU8t3xTe6rhRT4laIe/Vo1KhdT0OMVcONJkRbdNzw4U
         Nid42N11QRE2BrguHu3V6S4DJ0aNFUAsFXBnDuWYIbsiEHNykgLkCp0sxXGdOev/HrN1
         2UvA==
X-Forwarded-Encrypted: i=1; AKwUvBzUAkCY2awtxGXFDuGqbSznGoqwdMx891xzaj1Qm7Ge4bmUHP7ykaohaaEtaAqzFfBif1g=@lists.linux.dev
X-Gm-Message-State: AFq9FYI+/o1add8CPjbYgDB/RBrYIbQpPZ3Jb/p1PIFW6dXwCS9peDM3
	saJa113xmEbIhtmgsJDVTywRsWe/6NCrHRf0wlp+up8SQrJTZ/vQq2gazauzi1Bcii1PqBtPqh6
	2Dug8an9219tNUYZeX6Iy69itkAifQ7k=
X-Gm-Gg: AYBFou29wbeF5JT2f7PbV2JplTggGmb5Bc3NXfSbqIgib0Xhdv/e6AjYEOtR0TJMyx8
	ifbEtyPxkuAiIX0LAQWSFg5WfBJquaRt/vaUMGQ9ETyqby99wbp+CXX8LD4Jl5y9U80g9Q3qLKT
	uCUFV3DEliXjwoKGsdodg7lbxkGhKdZvLMmbvmutnOwEOMkNpjHECxj7suIUqBIDYpR1nl9QrtX
	fm8ymb5kbNWA2/7hbWWoRjeUUU3HjcXtlsiEGdJ4QwaqS9R4eBWhjustRftQwDIQVgCNC5v6Yr1
	A/eWQSHBM0xzJiRF/fiW064EmOqu/ebzrdtYzitOcvkBVxs7o9QgCkTouAgzky47/VPHAchIXYj
	iKTs3dAWYx9jSKf3LhiIGL2DBL5IlC37YtyZJeshYlMyL4mCUP9Rn2ilhQFQB7AaJsMRfxw==
X-Received: by 2002:a05:693c:88c7:20b0:366:703c:5f0e with SMTP id
 5a478bee46e88-3674ef1f33cmr2092100eec.35.1792565200654; Tue, 20 Oct 2026
 23:46:40 -0700 (PDT)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261019100406.103687-1-clamor95@gmail.com> <20261019100406.103687-4-clamor95@gmail.com>
 <ate5K6ZdrSoBUI08@google.com>
In-Reply-To: <ate5K6ZdrSoBUI08@google.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 21 Oct 2026 09:46:29 +0300
X-Gm-Features: AclHuK9vSBGobmYgXVnmsJbAb2zJc_kKp_DYHLaIwx6A0bp9NGDYceSKiyk9FqE
Message-ID: <CAPVz0n13NFbY1ChZRkc8_2CQd8HfjahA-gcRWzxsv7KbAxf5Ag@mail.gmail.com>
Subject: Re: [PATCH v12 3/7] input: serio: Add driver for ASUS Transformer
 dock keyboard and touchpad
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

=D0=B2=D1=82, 20 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 22:0=
4 Dmitry Torokhov <dmitry.torokhov@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Mon, Oct 19, 2026 at 01:04:02PM +0300, Svyatoslav Ryhel wrote:
> > From: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> >
> > Add input driver for ASUS Transformer dock keyboard and touchpad.
> >
> > Some keys in ASUS Dock report keycodes that don't make sense according =
to
> > their position, this patch modifies the incoming data that is sent to
> > serio to send proper scancodes.
> >
> > Co-developed-by: Ion Agorria <ion@agorria.com>
> > Signed-off-by: Ion Agorria <ion@agorria.com>
> > Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
>
> Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>
> > +static int asus_ec_kbc_probe(struct platform_device *pdev)
> > +{
> > +     struct asusec_core *ec =3D dev_get_drvdata(pdev->dev.parent);
> > +     struct asus_ec_kbc_data *priv;
> > +     int error;
> > +
> > +     priv =3D devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> > +     if (!priv)
> > +             return -ENOMEM;
> > +
> > +     platform_set_drvdata(pdev, priv);
> > +
> > +     priv->ec =3D ec;
> > +     priv->parent =3D to_i2c_client(pdev->dev.parent);
> > +
> > +     error =3D asus_ec_register_serio(pdev, 0, "Keyboard", 0);
> > +     if (error)
> > +             return error;
> > +
> > +     error =3D asus_ec_register_serio(pdev, 1, "Touchpad", I8042_CMD_A=
UX_SEND);
> > +     if (error)
> > +             return error;
> > +
> > +     priv->nb.notifier_call =3D asus_ec_kbc_notify;
> > +
> > +     error =3D blocking_notifier_chain_register(&ec->notify_list, &pri=
v->nb);
> > +     if (error)
> > +             return dev_err_probe(&pdev->dev, error,
> > +                                  "failed to register blocking notifie=
r chain");
>
> I think sashiko is right that we need to register the notifier first,
> and in it check if serio ports are ready/registered or not. For that we
> probably need a lock and set pointers or flags in serio's start()/stop()
> or open()/close() methods.
>
> This can be done as a followup I think.
>

FYI, Sashiko likes to hallucinate. Initially notifier was registered
after ports, then sashiko suggested to move it before. Then in v10 it
fussed again and suggested to move after. Then v11 passed without
regressions and now in v12 it fusses again that notifier should be
before.

> Thanks.
>
> --
> Dmitry
