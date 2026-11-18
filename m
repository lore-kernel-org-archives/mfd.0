Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795030266;
	b=e0vstl6KTP3HnO2oDJVqxasUKV0mVur+f2A4iw2EWcaqlNALQJ7LgQfYGe+wNXm4z9Pt
	 QqvISyUnH/ap82MyBuykiHGYJh2nd7h00+Se10urxu/cwde21Jk6274G2BxAemyUJbLwf
	 mNjcGXdPEym3GHBTf3OfT9Cwqg2+Fgj9fAPi8T8zfoy6uv48+H2haOqGmdM5EqyJKpbdA
	 bqreThsTeT08Hs7khBHt8D9OtP1+befmXp65Z3ipSVQG+IKpQ4noZqGLUjAcBtrzo8ew3
	 jKdTNYS/6kBScj0Ah5cuxJeN/Fo+9nIxxwkmH7Z7fJ1FflyfN/5wjn0OlLEFtNDzQRg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795030266;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=iAbjlXus0iw2LllxqZoryy58tCqmnnXTzlAaD4u02/I=;
	b=XiZaVBpy6xwv7rVKAkOadtZphUY3ceIu9gxqcsKvy51dDsI0igzgHDYVUyPCNv2zAwi2
	 yeJJGFy7ikO5ZnnjPMdsIpis41L9vWrJsJPKvWcA+/W/YIzUcW2zSsDtWp31q5avRkK8j
	 ekcZ8hZX80Y0KO7e/Dd89BAJ/hzkb09PkiehMy5FrdQ4vVP4BQH6WOjOU3mB67gf6nFOX
	 5X1NFlM6TCy/MNo0MNjK2A6Dtjq9HvxSMgyQpCBp6TE2Frx9dNpA2Oya0Vf99XnBFUUkG
	 d+I79RXvBbGxHun9+PJRRJoZ7YS8YMgsixhld6S0k2TtM/zoqW0mnd8bxnav5xuvKow==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EbGe5U6X;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21B9606E7C8
	for <mfd@lists.linux.dev>; Wed, 18 Nov 2026 19:31:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B21B9606E7C8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EbGe5U6X
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4d28f75d62so238666266b.0
        for <mfd@lists.linux.dev>; Wed, 18 Nov 2026 11:31:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795030264; cv=none;
        d=google.com; s=arc-20260327;
        b=SiIa0jW6OMWWA2qidECR0V8jJJljPGJwvMqxPN7EJGiw+6P/9cNtExL3rtEE5d7m1L
         slK2Os/ZTC0e4H0nju1wV+XUz1v6665lrPn7k6HhhkZnHME+vfl4oxK3tqsIz4xsKbaH
         ETXtNIschV7BWaPbSWFJjpb8JpSF0l2V9RIaLCVt155KtIiV3mXLYM1kkhriLAq6xtEI
         ufSHe0Jgiuqy2n+NvpYIfCsok2sm/16g/e0cw2KS1WnxiIY2PykHP3ZK6pennHjyvcjw
         t3xOwcqS2F5rapjUSrNrSn5iGAA8oDln84Dti2TcwDwnZlRDnOGfyt7J0mDpXMMgVm9o
         wuAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iAbjlXus0iw2LllxqZoryy58tCqmnnXTzlAaD4u02/I=;
        fh=Y/rtCaHCER0Yy1uf2EvqVM2La9p8ABKxA/AOqXmYI6Y=;
        b=ARuX6x7tI51ehqQ3nerSw3BsowZX4dyRAKUfYrhNP2R9ZT8JFHWKq6Id2XzBEQjHtJ
         1bJLTckAwN53tR0bT3UpJ0mBxQ2Vcr38zh+x2hYHYjOkCsZq0Zdf661BKw9caTlM4HSc
         FvHsoK9ZPqYl+pz8TgkCyUYr6WL9u5P0rlP3bluwI0p6XIvn/kYewcCQ+RhcUvMT7Eo1
         ZfxY8npmtX9OOf2xA4se8HuDpb3k7cpgCcOLbnJixFS0PLptr5qA0ayIVK/Ze9Lnwd4r
         InEfRZT9fzRA2UwJAlcbuOnSARTEIzIrgiHejaWbMaUkJjtxUj5mfFZSMxYxHrfk2fTk
         C4sA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795030264; x=1795635064; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iAbjlXus0iw2LllxqZoryy58tCqmnnXTzlAaD4u02/I=;
        b=EbGe5U6XGPLqcMjumqoXrAim5JeFtoXKHSDoPjCDThL1bwZrIfo+blFWhtxxnFMHmc
         Gl7B8eVNaJAJwVV9KmGzOa87EQ+19KAYReg0i8W7K8Nib1qQyuFVpuyjK2vIzCXRU7Gu
         jwRuE2WZtnc/IELsiKlvuJEi46BVRk5YA5H3Mwhsb6QdNh0BexNHeSioNRdb9EpgkJEg
         XuG38HUII/Q9OIxvD9AGbDOb8GBDlXh4dPspWrgseF5JOw673VCH5b/qGQSLBbusemG8
         HRu3witXKPkrMf6hC3yKhYsJBbSpmY/v2LBv3IvP97TlPA+3Xyq7RB1qMTViQIUsWvKJ
         rhwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795030264; x=1795635064;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iAbjlXus0iw2LllxqZoryy58tCqmnnXTzlAaD4u02/I=;
        b=Yu2+QqCNYID6lcGSepNV03DMTwGe9ZO8Tyx2sN0cPzp7hA3YevV1KclAV43yWMRpqF
         RC+aEJ9tHvk/uI1U/nZxaQcKbscJFdqTaEcsG930794NsF1OuUpSCmYjCnvXBFNHkLAY
         Zi3wiwVW6jb3rglwqapypFeP+x8tX7HjSQc/cpdXwla8dUykjLfwZA3hdZLiPX0Zfmt2
         Y9dmj5ALBPhLyO7r4gvOKwMYR8sBG2soeT/9b/IJeOr6EA3ViqiHeFKAzV33fh1iURfj
         ThaFV0ZKC3R+oOQXzlIv7BsIFQ2fNyUHdLeVRm2m4+Qc6TUNr5KvJK1r3puWVfzDGFmn
         Y2JQ==
X-Forwarded-Encrypted: i=1; AL+hErE5JFlXkQAveszktTX7cTX+tXNVUohnrXxVZqGtght/91yNPXe3zHaNy0IJqwm+Rn2pzoQ=@lists.linux.dev
X-Gm-Message-State: APuU4Z/fo7dqxrefFkgWtOcGRnQ6denWyCDtg8/UaxLqh1VIPLji0bh7
	Ymzpv56TlssWNqUairRcGOVaXxNBZu4igD6BGVZCtHfIXXC8DvGnkv9bjQmijUf0lbu5jcjRfD7
	sP+q7ieG35txz1eY3tW9Lw6ClsZU1DOQ=
X-Gm-Gg: AYBFou3IOP3oPlZGX77qGeoM9e4+qqPaRZy6bC18ILxJHTU5nyZvYF9BFfh1E+erqKF
	3zGd5wJwP+/LaEFhm+4NDNwem7GXfBQ51vj25XCW93AELsLGQS0rrBu2wHq/mOwHw+LFgViYSeN
	mef4kay04dLZ1YGLxjyZFpOlRWep7mhI6x7gXG5NbuUEAfaG1jpm/ORRkSVOwbJgiAesIYRCBtJ
	FtyIOfoxX+g4DTH1tXutxWOMkVnfJf+lBXCnUlUCrh6gG6XH/nKNsWqkA4RO1gtye/mZZR4khI3
	TuepM8P3krZTCxz8ebl3OYteA2O/mRm5QmMtedifVVR4VOV1W7DPDefZP9+Uf/EzSEEK1Yy9AkO
	xujDexRfWaUadCQfkvPOyKGvIuDU7bDWp1eM=
X-Received: by 2002:a17:907:f816:b0:c2e:317e:d711 with SMTP id
 a640c23a62f3a-c510e398889mr303013866b.27.1795030263845; Wed, 18 Nov 2026
 11:31:03 -0800 (PST)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261105194426.1113050-1-l.scorcia@gmail.com> <20261118152346.GC98456@joneslee-macbookpro.roam.internal>
In-Reply-To: <20261118152346.GC98456@joneslee-macbookpro.roam.internal>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Wed, 18 Nov 2026 20:30:52 +0100
X-Gm-Features: AclHuK-Q_ZR_eSDZWgs8r4i-RTkFZUMV5FI3ZV4LgWAQGQjLtUrjcLbEIObtllI
Message-ID: <CAORyz2+7q3BTeW3NsaiwN9riAbHV0Q_tCm6bBV7RoiDeAbcLrg@mail.gmail.com>
Subject: Re: [PATCH v12 0/8] Add support for MT6392 PMIC
To: Lee Jones <lee@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Linus Walleij <linusw@kernel.org>, Val Packett <val@packett.cool>, 
	Fabien Parent <parent.f@gmail.com>, Akari Tsuyukusa <akkun11.open@gmail.com>, 
	Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> MFD looks okay now.  How many more Acks do you need?
Still need the regulator Ack. Mark Brown provided an Ack for the first
version (almost a year ago) of the regulator patch [1], but it was
substantially modified in later revisions so I dropped that Ack.
I'll move Mark Brown from Cc to To tag in this email for a gentle
ping, I hope that's not against the ML etiquette.

> NB: This patch-set looks split in two in my inbox?
Now that you mention it, I see the split too. Weird, I sent it using
git send-email as always. I can resend it if it's an issue.

Thank you

[1] https://lore.kernel.org/linux-mediatek/20261105195206.3440-5-l.scorcia@gmail.com/

--
Luca Leonardo Scorcia
l.scorcia@gmail.com
