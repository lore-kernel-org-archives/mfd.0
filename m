Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794204926;
	b=UMlmd73XlT3uW+SZJQpVdKbjZ0OrdBcgXhsKY4bvbkkvYoRQ4Sagi28SGOzJecqxe8fx
	 OxPNX/VGF9JCF1oH4zZenkCKdXD0tTem4P0S5Svt1k++03rXwanNuwU91jJJmZbcJ1gyk
	 +kXZRmj91L/TIU6BDRbIJVD+CazGBBdlizkewWKE9Zxt9wC7S9wYGm+inNAc29Crlsvll
	 ME2p2nda4BaR+H7nzLO/zMHAjBHM5N+UblDkuy5KJPGrhHGQHeB4RkE+pj/RmAR/snpGo
	 5yo3YKa5Xqp06t3v0xS/MYg7iJj0TC6ElnsKuWXnl17vOfUsNkCKbbCjoUsIVokfZ5w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794204926;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1OirEdYPjNWlGy7xmMe0PuTtLR8bBFzhH374tYnu7hI=;
	b=5RTFPatiiE0gPZ5rA/xONRtyeZ6WftUDa0faIfef41IVtHV8ESx5RS+9RFjF4kOvKYTl
	 RybhOiq1G4zhke7mFy/30QUIe6mcfkTBFKObNLeHW4PomTpsLwcsgN1aZ1JLOuTngv2ip
	 CiFwRgsPcqyyp9CZRuwXHk5qdEAwOWMZKtS+3KVPXdArmRYrB3Q5xFUMOqfX9RlZcykxf
	 B7nnZDcsg3dHbsYOTUwggsiNq2WTLdioesNBmqbmLB0FfpQco6JoV4axmC3wsGugYsax/
	 rEOWwsedcsVJKZWFJ+pNHbnOW1BjB7f7O8Pv2S4B4lkRMrDhapeTaAzCcmXEu9IWfeA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MZdyonBY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6B7606A322
	for <mfd@lists.linux.dev>; Mon,  9 Nov 2026 06:15:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B6B7606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MZdyonBY
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c49b431f022so80073466b.1
        for <mfd@lists.linux.dev>; Sun, 08 Nov 2026 22:15:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794204924; cv=none;
        d=google.com; s=arc-20260327;
        b=a58AWFqfKlU3tll47/e13u7XiDII3UZEtuBds7sbuu5S1hCW48Y8WvPw2pNHEt1yBq
         j9VYnvAHzgDwnBU+jj+Fddwx+QkjT+lglEMnrQuyhAET65/hdyqnfXE3vphoOh1/JRyj
         5kcoXuui1dXCm8zxn1wYQMk2cTvesn/SqiuVM6AqiqN/bmAY30e1g60FpFu4XMHy9C79
         MiZ++7LKHjIHlDlAzwZ4CS/GBQ3v7vuggQrw/ajsJmwCCsN+Ze7Qqn+W7ogryeUKNzYA
         IvL0iFuPIdOqMqnV8ByyqOi6uXhssC74hNwZoCaDdCs4mad8YfTnUt9iKLlX1Ij7n5ca
         RMHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1OirEdYPjNWlGy7xmMe0PuTtLR8bBFzhH374tYnu7hI=;
        fh=9etPGkpQnnWzCiYTxbqFJx0FPwB/9Ruf8r5fa2IIXtI=;
        b=Iyx/6r45v89iDHLRDROiq3mdpaf27q8De97KI6wsmCjjoxDTGeRDCwVOaZW09bgf2K
         c8RTEZsJ7NKWjCW5ZWEU6IufFzpryOOpA+QLfsARsMqt+rZnvKzCGa+PysEku7w8xoqZ
         HMs+buKU+MuDVCac1koA37sJwKn24KZzwC5llbF9BtmpyHEhzLGS2dp0DTzxJ/GXgPY7
         KBsuNIn7eTWLbjI7MrH4sLY8QR6BjXf0ezVN2eOvpG22xr0jlS+v/DD5p2kFAhkL0Lkc
         qEI3rybV6sZjB6CKY2puuqy0Cwyaosm5z2b1aCGKUCPg4LMF6xdvAZ49/927K0+mA7W6
         22CA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794204924; x=1794809724; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1OirEdYPjNWlGy7xmMe0PuTtLR8bBFzhH374tYnu7hI=;
        b=MZdyonBYjqZQ6k7STB3KEZsKiADg7CqHyuzpGXxxFXiR0cplwCkKJOlDK9tMLJER0n
         ip5QoRUeok8lmfwjKQVE8oatpJ19QQBy+fHRN99t/rF/Xo0oesZzDMdz4g7w2m3AVJRP
         Y1EOFz7+1V/pMbjXtA/qnMQNy7sKJ45Lio5Gr6srJ6xnz/NEJFAgVEE4QDAy68+LvVyi
         1fl1lM8ntv7tKGFb2IQdq41ASnDftMbnlrEWHoOhPEsAnah1hAU64IWXkwZ8ekT9O71m
         nSdSZD/hhmTLIgFMPMKlkPPjH45drXgP2LAblEnZY/pAJuIoVqeEHXvn8zYWDXrNDiaX
         Nzcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794204924; x=1794809724;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1OirEdYPjNWlGy7xmMe0PuTtLR8bBFzhH374tYnu7hI=;
        b=c1KA5VQPmHCSmtVLZWpHTeY6VLWpj824h4RYoIUo+0PZgbVtUbbqP1ddkC6D3ASZD6
         tS7GFkfDlyFy+xLbPLh8ODSICUDXxZuiKPgu177X/vckFBMD7p86HhPYjnPNxcdxY88x
         QER6IJwn0yManuoF67+GLFnvEahOpHKO8j+1wv4pJiB80Pr9dR6eXEtcl1llEYlzaRAx
         p+CFvyA894lOD18/YZ/c10Vq4t27jTZ8vSiZzLIMXmAJ5+5c+hqVPmz+0GGTxM2wgUMa
         u8qk32Yub9S76ZaEvPJxJpG2SpDsSwbXxwbbUVW0hUEMzylXPZ0QP9exg8ZSe9HAk6AW
         FTmg==
X-Forwarded-Encrypted: i=1; AL+hErHRNLQbNx+yuwN4/9u0hCPf4P4rohhOHZkPkcFVPcYDINu0a37N9K12eCchkOpKrMMrR9g=@lists.linux.dev
X-Gm-Message-State: APuU4Z+uNDKQSB6I0ynT7mfW2dgzfVrc/OUebMzzlJfBatga6MPZBE0B
	3EGvOU0z8xH47lDiFYU6qll4eP3htqNMCv1hqMZM5kqjhNmrkb6TcOAxn2Cx9m6uthlAHSa9juu
	8wTkLly89zEhhkOOuA4zp/NF85+ILk/s=
X-Gm-Gg: AYBFou06+jtGTmiP5AgLejebHgIjnLNpbfGnIlWf2uiJJyPUEPo8/CNnj7jpAVo1PRB
	b7pcoo5xG8PC6fvYjJOSUsjfcKyzNfugAlpy8bWd7KIwVmjvXVDnl6KJGrwmb1qch6T+xN9Uueu
	xW/NEQv/O3nbRgll1yTzfYbFLEPcK5IZW+onXwlqMqWFh/965XTMCb4V945hNyLUJvaBxSpd5aT
	9z932Ov9eJvSqfs0H9nAJ+D3pxBKlJw9XI9kqNfdJyGou0qd/mysZxi/fFWAWsrViTZWw71SL6G
	RUSlliWR/X8+YePwuvAWI1qZGrUY/1OMn7s6BhKTOG7FFziMHmGqG5x6fipYjU92LT/hN9iYcJr
	ozSZqZyYppodp+HeO2pl3ferlu4eLq2VXvw9R9m7AfJsFdSORxh1xDMJP6DVMokM+OyhKl2Z0Eo
	tQL9pb1ojy60dj3sU3YpBasm6Vk6C6sxNH4giPrdEnbY99+iclaLM=
X-Received: by 2002:a17:907:3ea1:b0:c2b:4142:2db1 with SMTP id
 a640c23a62f3a-c4d6d842e53mr191712566b.40.1794204924269; Sun, 08 Nov 2026
 22:15:24 -0800 (PST)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261108095634.100517-1-clamor95@gmail.com> <20261108095634.100517-3-clamor95@gmail.com>
 <20261108205143.134d6aa0@jic23-hlaptop>
In-Reply-To: <20261108205143.134d6aa0@jic23-hlaptop>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 9 Nov 2026 08:15:10 +0200
X-Gm-Features: AclHuK8Qn06eeEYq6AauLfpWkIVYBvVrCQiH0heTOHXTTI9POYlOkAaf0cbYYK8
Message-ID: <CAPVz0n3uRoQAN=rk1dHyHMFxueK8Ry0UsDxkxA=jzgGP7Ykceg@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] mfd: max8907: Add ADC client support
To: Jonathan Cameron <jic23@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-iio@vger.kernel.org, mfd@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BD=D0=B4, 8 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 22:51=
 Jonathan Cameron <jic23@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sun,  8 Nov 2026 11:56:32 +0200
> Svyatoslav Ryhel <clamor95@gmail.com> wrote:
>
> > The Maxim MAX8907 has an 8-channel ADC at a fixed location. Add client
> > support for it along with its regmap and interrupts.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
>
> > diff --git a/include/linux/mfd/max8907.h b/include/linux/mfd/max8907.h
> > index 35b2ede54f856..cf304afc782d6 100644
> > --- a/include/linux/mfd/max8907.h
> > +++ b/include/linux/mfd/max8907.h
> > @@ -153,6 +153,51 @@
> >  #define MAX8907_REG_MPL_CNTL         0x1E
> >
> >  /* ADC and Touch Screen Controller register map */
> > +#define MAX8907_REG_TSC_STA_INT              0x00
> > +#define MAX8907_REG_TSC_INT_MASK     0x01
> > +#define MAX8907_REG_TSC_CNFG1                0x02
> > +#define MAX8907_REG_TSC_CNFG2                0x03
>
> ....
>
> > +/* Regulator stride */
>
> I'm not sure what this means. Stride of what?  Seems to
> be some offsets in the register address.
>

Regulator register offsets.

> >  #define MAX8907_CTL                  0
> >  #define MAX8907_SEQCNT                       1
> >  #define MAX8907_VOUT                 2
> > @@ -165,6 +210,8 @@
> >  #define MAX8907_MASK_OUT5V_ENSRC     0x0E
> >  #define MAX8907_MASK_OUT5V_EN                0x01
> >  #define MAX8907_MASK_POWER_OFF               0x40
> > +#define MAX8907_MASK_RST_CFG_INT_REF_EN      0x01
> > +#define MAX8907_MASK_NREF_OK         0x10
>
