Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794348049;
	b=Rgp8PB57nCT1L5JLjKIxajfzgPRza8CiKkGy/g+QnNaZY/Na9zVaWcXpvMzOmomdVeb2
	 BDqJsxZXqC7+Hsdp6MuLVS+EyYGs1Gz46JMkaO17TVPGHr54vjvQNKRp//Ceu5ycbIuYJ
	 3EK1j4DUcj92EyU6BoZQbXAeSmdwNb9TW8Rm13MrFGucmHRpT8fucZJ5iPQhyNyo9HvrM
	 M9pWR3hZK73Cl8QplomRiHmu8d5dQUQckzfO4aEcGwUNb4ExIBVPbSo9nNYEoYuo2vXma
	 0vLO8YgG01kmp3gK5CLm8e6ZLbCYItJ+eI1lMVxOHsf9FKfACJcxNNzD9beCBF1McyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794348049;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=IK4zKxFDyPpC3/LDTslXGDQ25QsGB0fCMKhC7Rnd+mQ=;
	b=oyiSAdnJPW0FiNn9TJduN5XuUrRjVfxoK2AZ72OoUUvegn02NBaouhuCp0pR+HtZu2sl
	 0tj78SdyBHWSDhs+9lGYvX4yS4a4/cpOavCkYDVgqtV+MrjPsXpmkmo/bzMliiynp5p4k
	 f08vqNsEecGlXYohInJQ8qHpwiXHVtTFDxrZ2mnvzLDk3N+pwoNOSD/pd7iYe836x9rI0
	 R/BpmFyjdLXzdnY6wFe44aqXJP4Jy2SoV7EK/hjdQSF7OwU7TfTCeCnfRXjSPjI8YB+rq
	 Ym0vRBvBoqNDB7qadcQ6bIz0uWD+HVs0fT0I9zUN2J5fdJAQ5nVztT3gXThYqOwIKsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SinBlZHL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1DB606A320
	for <mfd@lists.linux.dev>; Tue, 10 Nov 2026 22:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SinBlZHL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EAF41F008A1;
	Tue, 10 Nov 2026 22:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794348048;
	bh=IK4zKxFDyPpC3/LDTslXGDQ25QsGB0fCMKhC7Rnd+mQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SinBlZHLNa/gWDu/ER1bs4QLjHEB+uxbSqdV96NnoeyZd1sJSaFasKCY8xN3SShS1
	 PmpW+P+WRrOLy46R12/umRC9nP/2fpnslR+y7geUlLl53RNFiS8JBVXCbiwSB1XfmS
	 hzdmbv5KnnkKMrq0jYdl7X67Zt4Xyf0ZtFPlPvXevVnBOx0nzk0DRnObAfPwr03Kg7
	 uiXiMKJPynZgxhduuirsr/OfS3I3GPm1OqgbMCUTA5NdmyRUIQ+JC6kElwypgzpTDW
	 6QX7vMI/Uqn1MnSzhBteXg2sroIQ43q8wXr6Hojc7HQx7byg/KToFUMDvIuujydbBS
	 7cqTe/KYEMWdg==
Message-ID: <sashiko-outbox-207802@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 12/20] mfd: Use named initializers for arrays of
 i2c_device_id
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?= <u.kleine-koenig@baylibre.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <db421752980323be4dfb4733b6379db7da24bc11.1794347059.git.u.kleine-koenig@baylibre.com>
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
 <db421752980323be4dfb4733b6379db7da24bc11.1794347059.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 22:00:47 +0000
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
> i2c_device_id that replaces .driver_data by an anonymous union.
>=20
> This patch doesn't modify the compiled arrays, only their representation
> in source form benefits.
>=20
> Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org> # for Maxim MA=
X77759
> Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1794347059.gi=
t.u.kleine-koenig@baylibre.com?part=3D12

