Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792580435;
	b=F/tzZNIGSw92JGRSQNk9V97TXpYjDnF8abuDm1Y8d72sSLkPKu6tRITjwIiBAKXgk6NR
	 Dj0F1CPMspZSEQ3cn+Jlgh9tRq//5wh5N8fDxZQzqbX6gynsx2vOpWEhSgRUiEbQxI02/
	 oDSDa+IX5R3EtooJU0OKLHmCe4BcNnQKDm8vk+DpUt6PZF9qKvRI0Qc7TQ5gg9jJK3yVF
	 cQ7UURRXzgfuz6FpkB0w86OwXzXZDe9e2zHQtc8UB7+Q6/oev2tBnH0RMNek4Yt3ENbYE
	 4Ro7LD6N1Ino/tfxKDyJX+FGN9n1UBhJHiacSJpQjGxy8dZBe3vRmZnC7XP95rjo3HQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792580435;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=S11H33Y9HYyZcgx/Yz+19n5Hqsrww1foqkVvLCiB/hs=;
	b=wm2gOcbeJeo0EHbfReI8p55MeF/W0YmEEARANH9N7ubSiEAf8JQgmpGd14RvW35Jr6vL
	 g7kLz0Mg5ByF/rhyKmxBjnBodxAjH1XZ6PaagWfD9ULrPfWGoow+VKnWQH1XYDoc9Hvmw
	 2bDGdccdCRIaGtCkxVhfjKVIgmatoRev8ZN/KbZ/KmyHS49b2XxyyaCb4fBI2/B4PYJHC
	 Y2zf2o9p2wB6HHaNrxZdPNIus5epmNRpdFV+HXLvlc+hwGstuEDO2fbUsBAbZe6/xSm+J
	 P0mjk25SQ+4593u9fQIA4crP2a1ChBcQ42lC6NPVZfSyZS8nPrpTSvnULTEE52CA9IQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P8m23qiv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6556606A319
	for <mfd@lists.linux.dev>; Wed, 21 Oct 2026 11:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P8m23qiv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 479371F000C9;
	Wed, 21 Oct 2026 11:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792580434;
	bh=S11H33Y9HYyZcgx/Yz+19n5Hqsrww1foqkVvLCiB/hs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P8m23qivjANh2s1DaIalj1YOVuwhjMtjhifO8I7tLy2m9sbN906VPuiZrPVnTic+f
	 50AzIO/AdWpH4vNXpvTKLFpMuYBssjyyeK/tOvDUcIq0D1tlBlCJcrfeaDa96ryuOG
	 9USGF7B8GqKSuhS8aq89zQHKz/j3QSHHjhZzMD/mDTgAD0kInNV1nV8Te4Y5JomkrE
	 +HEPSO2SPEH3SjZyWv4xQUJvatGM4UJSEDTg8mOkhKwqKMXUCmNDQkqiqMDHeCdEm/
	 Q/cPwD+5MklhOuqx2hk1Zh3UTDh3o91PvEYqHPQf+rCc3XLocYNyyPIpjUiC/zuUa4
	 qf03ZLHB5tcUA==
Message-ID: <sashiko-outbox-180140@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 6/9] input: keyboard: mtk-pmic-keys: Add MT6392
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luca Leonardo Scorcia" <l.scorcia@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261021105109.199886-7-l.scorcia@gmail.com>
References: <20261021105109.199886-1-l.scorcia@gmail.com>
 <20261021105109.199886-7-l.scorcia@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 11:00:33 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> From: Val Packett <val@packett.cool>
>=20
> Add support for the MT6392 PMIC to the keys driver.
>=20
> Signed-off-by: Val Packett <val@packett.cool>
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021105109.1998=
86-1-l.scorcia@gmail.com?part=3D6

