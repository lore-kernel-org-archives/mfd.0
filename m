Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794417009;
	b=G+Dq9+Fi+Lo1rfVJ1wtKxyuUlmz2Gnld7mAktw8HnyaDnQYpfm6TrU0JzE4H6UpOydbW
	 rpK+t93rvHAjmD5cXjo2og5IhCutP2WA9KfLJWxe5i8A1jgLz/6Bx3pdAMRqaEKkUkTSp
	 8ogTZ46STVv6RouOXQ7CS/iUwRNSLCakwxUDma09s8WCaLQq0IZGyiEhEVJ84tmNPYlZy
	 454NT3h0blT8J//ePLCtrtHi6B7fsfqwjN/QweZ9/G8tY+q8SpAPDva8tqh/RYDueBhgf
	 XlMFQT9XG9tA3XYzbm2qS+G2/61oJEvTn5mBbyr5GItkZphtkpeOAos1RiwWLXTOo1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794417009;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+Gbv4WJLllIvu5lb2tnkm4pgwubgC5F73rOCEk2Uvgc=;
	b=ZMVuH5fA6y7vPdR7FJO8ziS0dWl4D2J1Rdf7ztVP6AV6CNQHewNE3IyyaR+U0T+6HiYa
	 q1VZ/y49/Z1g4f7YnN7geXgpliSQ/mUkI2qa71TaPWk3T2u8jaBYQ2B7/iF5TfG/x6OPH
	 PS8rl/J50IZikLCl8shBCLCpxbhn9fvFyDPhJjrZN5TmbTIjKNx64akNH655SWSrgT1bm
	 vnpeJeeNS2WdDup98vunxXJicxI3H+MPVHMVjc1hBWiwDib1SqpRkQx2E58fzBoyyyms1
	 ybESr2NP/ZTxbW6sZfgfh3fhWI0017CLuS6xGgOMzsj/hL3WgzQ2JjccXrWJdTff0Fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Nno1ywVV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18C7606A324
	for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 17:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Nno1ywVV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AC1A1F00A05;
	Wed, 11 Nov 2026 17:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794417009;
	bh=+Gbv4WJLllIvu5lb2tnkm4pgwubgC5F73rOCEk2Uvgc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Nno1ywVV2wb8vBxe1U2V8CZRCz+3Htxk0UFRyEmX+hy1lApnyr0YIsGz9GXqq0FiZ
	 QPENbJPEuDkRU+4qnxgEzZLsIOwBI4jM3t7XHH9wOR/B79OL17ZE5hxoWTmBAdnIqz
	 qsPMcyA1yN7pH9c8EftV3TKR0pwsrvYyZ2cVzOqBS9KsM828htaBLuWvCzGr3MBEvG
	 Bn+kzUnfOlbs9ep3RkOeIjwbffnSxYKDU/imzfIMtghCiZC7/PlEflHXpqIz3AEaQk
	 57ZGfzm+k9MSp8N58uzXFDTfMUqD371ddl3qDd5/iopt5glJars9gtW6ElUiusB3ZN
	 +JBQ2nr1ssHuQ==
Message-ID: <sashiko-outbox-209380@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 6/7] dt-bindings: mfd: pm8008: Make interrupts
 optional
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jishnu Prakash" <jishnu.prakash@oss.qualcomm.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261111-pm8010_i2c_support-v4-6-4549cab1c8e4@oss.qualcomm.com>
References: <20261111-pm8010_i2c_support-v4-0-4549cab1c8e4@oss.qualcomm.com>
 <20261111-pm8010_i2c_support-v4-6-4549cab1c8e4@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 17:10:08 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>=20
> Some designs integrate the PMIC with the interrupt pin left
> unconnected, deliberately. That of course compromises some
> functionality, but the core function of programming the voltage
> regulators remains there.
>=20
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111-pm8010_i2c=
_support-v4-0-4549cab1c8e4@oss.qualcomm.com?part=3D6

