Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794347956;
	b=PY+BcTlAWlHwDmqg5WdSrisnbQswIrVjPTIOcu3F+nnUUg0z32EwzT3blTzk9B9hwXYk
	 MrltG+VgXT68S16MWUM25imzZ7sZRTTb8tiar7n1dBJeI1dCVnfWnsajXn2rakKziANht
	 z8ycRZTDWAl2ZLJzJIif6Kr+wnhtGcWpLCZcUTQVpUWXikYUTmlt12eQ/VZ4cNkGUFU37
	 09pD32Mpxvr+h7q8TtXdAcQQTU1Ye/Jo8Kj/SKUROWy07PKmZsZ+UU0jkPgEf6bstxYh6
	 nybf5m8xIva+SfD1LVGSnYJ7kAf39Zhx+WA97hIUhjQwgDq/IHookZzvRquvuNqGb8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794347956;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=4lfg0sI/cdj507Ks1QkPNeL85IcVcLSCHow81O4G+5Q=;
	b=HaxtCPB0oUriE3XhN45aVW7VOIwwGHdEpET4/GYbALLLKSrmhN5+Az/h4eDQ5fOdfD1m
	 gLr4RgDU8p8ygen8D7nqZH4KBJTa/+U7GRtk6nvwqufiv7V9eVCHbEctBMzV+yFNKaoY+
	 9Gy/s/fwtA1oIIwrxuMAof+kP6AUeDo9HU9HJsre4uIuWRM2ANUJG7tassHsEwVHT4kVa
	 4Eker7TFZRzXC3NKj4FBdmC/qDto0NNQELTXqAe+1JEPzaIl1Hveh5xJaeD1zOTnuoYGM
	 FoSM6j+mRgK+yPqPk05oAZcwqvDCBLSyk393YggTuUdNUO6kL9+Udrb5UMT1+TwhR4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JdHQrAmO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E375606C986
	for <mfd@lists.linux.dev>; Tue, 10 Nov 2026 21:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JdHQrAmO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 006B31F008A4;
	Tue, 10 Nov 2026 21:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794347956;
	bh=4lfg0sI/cdj507Ks1QkPNeL85IcVcLSCHow81O4G+5Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JdHQrAmOfFsZxbe6a9l2yqA5VEL0dRGUUrQu318xuyBx2UUbfSXGPhPsS5llw5L5p
	 1cIGWCMPiVdTHRNGKwd7kY2EtwoukmmRyibFk9m0rFMUglfir1n8/2WjLpkDyPOK1S
	 8jAu/TaulDf+BoVZkt3PfoJL9/ehRE0otxMR3qtXFiO3f1ocTr+cQ+AVjLeJMSSBAy
	 sJTTlXBxl9sqoVlBmftolW5vaQalAxs5pplwLOIDYpG2nOCu6r/6FFfG/rUxyiRJso
	 fhmfo1xlYAClVD14aWZ9u7D8XzFlgrlx8Szbsp0W8hVly0TeLozya79njfLWr1htie
	 7iMSv49RkUlyg==
Message-ID: <sashiko-outbox-207792@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 10/20] mfd: Use named initializers for acpi_device_id
 arrays
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?= <u.kleine-koenig@baylibre.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <39fc883cf1c7077bce8f16719cca59060a395b02.1794347059.git.u.kleine-koenig@baylibre.com>
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
 <39fc883cf1c7077bce8f16719cca59060a395b02.1794347059.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 21:59:15 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> While being less compact, using named initializers allows to more easily
> see which members of the structs are assigned which value without having
> to lookup the declaration of the struct. And it's also more robust
> against changes to the struct definition.
>=20
> The mentioned robustness is relevant for a planned change to struct
> acpi_device_id that replaces .driver_data by an anonymous union.
>=20
> This patch doesn't modify the compiled arrays, only their representation
> in source form benefits.
>=20
> Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1794347059.gi=
t.u.kleine-koenig@baylibre.com?part=3D10

