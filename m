Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794390938;
	b=e8jRmV5pMZ/Ebozr0Vb+/SgcXpadAVeFfnsp9ff3+DMEicQLd/zxvgvEePeZqcLZO+MR
	 wMk9F2N1YmnroizUCbIyzS9zsDkhPbzUVV3FQJoV6ahRndHsQUt928KkRlMhm070h2Wgn
	 AoNdD/YBh5bvov03UZ5IKFBybRn4Px9qygj8xI06NIk4UX4FShiswXgZCCCH9TkbDqm1L
	 RrXtxpeuIoi68qU5TVuy9MFUX3hK0eB/Oj3CUGd7z4WtXOvceWUMsClQoQCTSG2tqTKz6
	 VCEepeCYDQoIybzB5wY5RzijqfmgyKgDRqX9T1LYThV6TXoiFNiTkUeSq0KIdH2U5DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794390938;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=1oZ46qbfzK1kC56ugvfDKIKqDBjZaNHDclt7g8ZJTBk=;
	b=cBXIyNn0NbHkx1ZWIimT0eFKv/OyzvgmLVFJ46shJTQ89VASbCDmz/OkRY6mAxGygohO
	 YRnchJaeT4hx63fXdLAWYowo5vMkgKVDrmiOwcxjQqtokrjB1GPeRctcsnJNXDgDQAGNW
	 H9khfWrOwdAL5P7vsk2rusHI/42oLprthuwU5BHN4aqdesIBPfYSqLDLbfPGudEtkCn0Q
	 fcQnrLKqPvyZ7NmSi5uc3Frc8lIlTWC2eX+WKIljBlErQNiX920mywP0N0uCf5u/iRyK9
	 XBx+4SKGLMeaPpCFPqmN3yMdCYeIW2kP2ItHH2Dsvx7mPGGxbpHFHYVVQzOYEH+pdOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=RDhNnuR9;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F29606A324
	for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 09:55:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8F29606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=RDhNnuR9
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so36162405e9.1
        for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 01:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794390936; x=1794995736; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1oZ46qbfzK1kC56ugvfDKIKqDBjZaNHDclt7g8ZJTBk=;
        b=RDhNnuR9bGu1UMBlVKp19/lXtEoFpe4U+pdIXLZzrZVwguRzSe0+/IHc0yg4gqI/yY
         GdK3FAEjoAWWbFbfHirgtsuqJUvSi15TRQ+rck5d6qGj2AZYZMU0lt/uq6GR6Yc8umZ1
         6PesM8h3xX6SPoYaf3bSX636tbi0ifR7/AJ478QYeg8UqCzdeVVxn9wyVAJLCpJoTYVh
         r4nUwwS0OXjp1IfOxAliEOAUIxk0p8myWHAaGlt6OjQH03ysmtOzmnEraCYZWZzqI6rF
         ENTfs7mSzmBZDWk8+ApKt+wIwIayd1qdgcXG0Doe6uyAVPBFRX1w99dG25gMbOfVbnBM
         aTzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794390936; x=1794995736;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1oZ46qbfzK1kC56ugvfDKIKqDBjZaNHDclt7g8ZJTBk=;
        b=lPFlQZIC6iSnTUqXBmmxElsIS9nyCTPpQ9vo3ZfHRh2y5alutZ3ETY+OPzlDpaZlqU
         mT8jQeocuk2YiO70toX0qce0qPYOhMhF6xmxnKCN/OtO0uEynh6asIg9aNCqyhwnyFW9
         05Ckrn14o/e7hqp4BUVlvdEiI0mCCc5wW7AVUT/SLcSsR+DjXd6ojRKADqsM1KetxSLh
         64TWd/BMJNiqcdFeAUO+EfHclEdixTuRtTj5OHInDYZUKL/FBoLrU1xn4rBS4lcV8L2C
         lo1zkMPuxeSZqO7/h7Sx/qBIM6IJo5iBLp0QNCU/GKLoUUyw983O4JijMCxOaGGiVXZ/
         ekMA==
X-Forwarded-Encrypted: i=1; AL+hErF33d9Zjo/vpJq9wOB9xDnY34oDoXF7bYQfNJYFaGW83Ktev8WBdAFjvSGG2rYCwRhczLY=@lists.linux.dev
X-Gm-Message-State: APuU4Z/RKVH3V22glkAiw21vonsU6sEjDmW685Hb25TlvZisyTmiFQFX
	G9muDS9Iq7DdKvX7/0OYrE+TqocFESnSvmZ4EzWj1LpkNm7sDe0Brolpz3j6JuhVTc4=
X-Gm-Gg: AYBFou1vtIezI/y7Y66syCBpDJxQGak+GelUW/5Usc31mA8Y7e15jSlIfFPhke4za+K
	6jU+wlh/9Kde350dRHjz1wuI6/PJrWKyzTIzgZMvGxyU5L/F+H9pQFrKJWP1dgs4EnGSo1EuUej
	gMrFSU9Eh6axF0ZSoZ1oNo0zIQQkdTOwvylBmdQQ+fycsOgn0IMCoP/94RzFOqT83U+A9fLaJ7v
	mPEIKs+czJLIkX4yKNlkYZ4cO56nVbTiYgHGnjm9Ggxb9Zka2oreUteFhqrjQeUevX3Q1KKdxVQ
	UNEXX/B/cQS9lgKC/kdTUdPNVRZ553i7dPo6lqdRAq9QoAdnCvYygpJcyMns1ast2S5TOhQzNZz
	YdXzYXd9lENeqXXpFG0OzaTipm06kZZ7RNcW0wGKv5fX4qCDXwio2JEcT7DOmvLn29Iw4wnhMSv
	13khLUV4eEPgVi/Wn4dd8o+TB1zfKbFrXR18FKG5deXvz9Bg4mfqEj/EE6gHDqCNQm8gHvYnUN3
	pCj6ho2KpNRZmOqWwmwovZks6WghCaroxjA+s72PW4wsR/bronS2nMLXSbT4KovQzoLP+Sv9lHB
	xMcxzEMCK7so5XnEkLvniKVDBFDea6cKsfzfJg0tb7zOI30rCiuxs++50s9U9gp17u/g7Zobh5X
	28vElD2K7k078jQ==
X-Received: by 2002:a05:600c:8b83:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-4ba0935bde1mr34105275e9.5.1794390936037;
        Wed, 11 Nov 2026 01:55:36 -0800 (PST)
Received: from localhost (p200300f65f19a90460510dd506fc51af.dip0.t-ipconnect.de. [2003:f6:5f19:a904:6051:dd5:6fc:51af])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4ba01fea9eesm204694395e9.11.2026.11.11.01.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 01:55:35 -0800 (PST)
Date: Wed, 11 Nov 2026 10:55:34 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Lee Jones <lee@kernel.org>, David Rhodes <david.rhodes@cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Zha Qipeng <qipeng.zha@intel.com>, Qunqin Zhao <zhaoqunqin@loongson.cn>, 
	Thomas Richard <thomas.richard@bootlin.com>, linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
	mfd@lists.linux.dev, linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Linus Walleij <linusw@kernel.org>, 
	Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Subject: Re: [PATCH v4 10/20] mfd: Use named initializers for acpi_device_id
 arrays
Message-ID: <avQ19KBnQ2mnhZa-@monoceros>
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
 <39fc883cf1c7077bce8f16719cca59060a395b02.1794347059.git.u.kleine-koenig@baylibre.com>
 <avQrO4etMgpOhvwF@ashevche-desk.local>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="h4cbpzud5ptt3x2g"
Content-Disposition: inline
In-Reply-To: <avQrO4etMgpOhvwF@ashevche-desk.local>


--h4cbpzud5ptt3x2g
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 10/20] mfd: Use named initializers for acpi_device_id
 arrays
MIME-Version: 1.0

[adding Pawel to Cc:]

Hello Andy,

On Wed, Nov 11, 2026 at 10:45:47AM +0200, Andy Shevchenko wrote:
> On Tue, Nov 10, 2026 at 10:54:35PM +0100, Uwe Kleine-K=F6nig (The Capable=
 Hub) wrote:
> > While being less compact, using named initializers allows to more easily
> > see which members of the structs are assigned which value without having
> > to lookup the declaration of the struct. And it's also more robust
> > against changes to the struct definition.
> >=20
> > The mentioned robustness is relevant for a planned change to struct
> > acpi_device_id that replaces .driver_data by an anonymous union.
> >=20
> > This patch doesn't modify the compiled arrays, only their representation
> > in source form benefits.
>=20
> I don't know who is the first, you, guys, collaborate together and come u=
p with
> a solution, but I have reviewed already this
> https://lore.kernel.org/lkml/20261104-acpi-mfd-v2-0-64b9dee3baaf@thegoodp=
enguin.co.uk/

Oh, I wasn't aware that Pawel is still on that. Initially we had a list
where Pawel indeed was assigned for acpi_device_id. Since then I went on
to do these changes per subsystem for several *_device_id at once
(instead of per *_device_id and subsystem) and stopped looking after the
initial list. I might have mentioned that in our internal chat, but I
take the blame on the lack of coordination.

Looking through the differences I found:

 - different commit log
 - I have a cleanup to drivers/mfd/kempld-core.c which conflicts with
   Pawel's series

@Lee: If you take Pawel's series, I can rebase and resend. Most of my
patches still apply just fine on top of Pawel's series, so you can
preempt parts of my rebase using

	b4 am -P 1,2,4-6,8,9,11-15,17-20 cover.1794347059.git.u.kleine-koenig@bayl=
ibre.com

Just give me a poke when you made up your mind how to proceed and sorry
for missing that conflict.

Best regards
Uwe

--h4cbpzud5ptt3x2g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr0O5MACgkQj4D7WH0S
/k5a3Af/bShGrqVRN2amCZ3YsA8JwcyDvTbN7ekxEzRPDe3bdsK6O+VNVq3fu6+A
rXE/yf27jSePTzpLzVN5UjaJUtgdLpi8JIUz8tFpWvLxcQ7XJGC09ZljCzmR9D1+
wCj7azL1dvdk+jjz7tZ+RnsUPK6bvSWhgvEV2mbVfggFIU/YqhySmIhYBhrc50mN
1GRlU5cIuEyXVwwmIk9BRNv9drjXrFZfkJTd+H4hbRAFOfVq1QmIjHDUl6qi3Rbz
ubQBpDM96XgUe5HUTXgG0Ho9KdASNlB+OVv+iwb32nfc2PZjPPmSKFjK7bKTV1Lh
3u6/0xqIvwenZeWxe7CkONoCcve8kw==
=t/3h
-----END PGP SIGNATURE-----

--h4cbpzud5ptt3x2g--
