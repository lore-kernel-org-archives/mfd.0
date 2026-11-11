Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794428504;
	b=SW6CPzOmQiQ1oVEkUqvH/IdFV0gTU7zBmJ1Fh6L5mQcN2TEMLMVgMGZkf20pkX8SQeFm
	 oIIxF9QJyOcT383lQBzN23lCBy2O9xb0AOM4ATAGLupkE1ZFkhbB8APTp5WzmoRCT72yN
	 KSW4ggOiHn7iXOBDiRNEP/qwZjvV7YjP2vv4vT5c+DqP6r8hqiF/v9sgE78YjDfyuFn0j
	 IWgJfTFuY74V8K+PQfuisE5x3vr7gmEYj/EpPz9uuQKLdX+XvErFwB4pVzoEZakSJ4/Y7
	 Uv0ihbkFbvz7RxrwqKkZRUDIdG0MlwOOX2xgtenh4sX2ymkQ6lGlTXX83l3QdLYeGNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794428504;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=HrhFAmedskVHwjT++BBPRVkmEMuKGFWGVVIx9zOAxC0=;
	b=KhYOUFlMqd6ns155vgoHAK3xXWXBqqFvSG2e4l5yHNoGheONqBuo768ZhGY2+DXk2TAE
	 KF+aDhcoRMIm2A+Vu+z7fHQSfMTLjZq9DcyQr/OQS3+JkAZc7BbSz9QNY6uKbbK1pX6DM
	 lOSKcRxxbMyPdNOj34RSd9gBhZNEwCVaUo0YcRaEBib/zY0xxVkTlafkoHUptk36Gkyy9
	 dnoM7W/y/2/sdXJ8jgOelHg6Oewz9zQB5Fbt+MYgGJ4q0AMjCoaVMMk12ZbaOvRCW42mi
	 OfPWHngrB0paozYCbP2r4XGk7JJdXDjb5hHeWXl+A59RfYlola8IC/vPgHAE6/+Lojw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U4i+l5Ta;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE9B606A324
	for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 20:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U4i+l5Ta
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D0FF1F00A05;
	Wed, 11 Nov 2026 20:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794428504;
	bh=HrhFAmedskVHwjT++BBPRVkmEMuKGFWGVVIx9zOAxC0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U4i+l5TaLqhQU6Q9hTZPaK8EVq1TTP6V3VoEkcalpVqyuANq8n8f2kPdal5bghtJc
	 rE6SPPTs4u8sA6uZLLf4fUK1MKaUp1gLgmwjpZVWP1BRL3ec2Q5qevs8fGPE2iLnju
	 OrUsrTEjExVfLCO+LCS653Nbv0peMi+11SzUp6rTyl7dDz8jgDpVUlZkW3O29qlRdb
	 J9o6xwBxgzpFKeoshnM/3666N3LSn9xOx1Rnsa7Sg+rdQ7yyZaVdan06xmVtFRN+gS
	 hyvX3PcTNOA7ulqDVfIGHRWOAvnMnLZC4u4YB3ntL6wK44tB4gJYzytdWmXntAbjk8
	 Zm6psnvZWppOQ==
Message-ID: <sashiko-outbox-209641@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 02/12] dt-bindings: mfd: Add HiSilicon reboot mode
 syscon schema
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Um9iIEhlcnJpbmcgKEFybSk=?= <robh@kernel.org>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261111-dtbs-hisi-v1-2-6c9f5f80716c@kernel.org>
References: <20261111-dtbs-hisi-v1-0-6c9f5f80716c@kernel.org>
 <20261111-dtbs-hisi-v1-2-6c9f5f80716c@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 20:21:43 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Add a dedicated schema for the HiSilicon reboot-mode syscon nodes and
> their reboot-mode child device which are missing a specific compatible.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111-dtbs-hisi-=
v1-0-6c9f5f80716c@kernel.org?part=3D2

