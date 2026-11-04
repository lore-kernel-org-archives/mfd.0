Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793808815;
	b=VwR3qHs4b8akZY4LyT7Hs6R4CI6knnQ2X2ZjVHC1ODkWqcdec3k0YiTC4R8m3On3qMVr
	 Ou5PWecahK7Ddxvffo1SG1q17G99QaDnFU5XUvDLYn3fIbua2+ROFbiW4EdfhRuTeOUoJ
	 oyz2f4k0ooWfAS/L7MCVBt5kMgFuyfaLJAD5p/0cYfZZ9G0yXUirLPcvOmEJyWPrLKJrk
	 i9PlLAlXWk8jDbr4jAgNZLUPpM6gwfrHpoffYQ2ToFXoP95rhsAUdgU0caCpHnkTgGf/k
	 g2yJPCZ0sdCIfGt4TFEO905ZMWAdWIZI++W6tRuJNeyni1HtO4OBwyjo5KB5FboM9pQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793808815;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Uu9UK61ReQTjYdHjAIr88QaMk8bWGQZztS8H4arLM4E=;
	b=geDmtz0v+QBSeOOnchObbdqyXZCi6IxLd677vvulx6TRS7bhm7+tDJax9HJYs8t3gpYG
	 IytT9XrFmL6Uh514HsDQImXW9BEN7e021G2h933xdAEukeJFp+qg8FPUxmp4CPbAP9Rsx
	 aRjHw8KSRtickpy1FWJED5uW9G3ixvXY36eEfSuZpicl3uelpANT/uD1RmPcGpy9U0RJw
	 CbXRcxOP40fxt6nrC7JUgNNqAtnrXXF1Iya6Z0Q/yjZeGdi9lk0QvD2p+lRGRLRmatucG
	 ycTmbH32X4wpMtj0B1uwA5voezQzdv34jssKT2y33TjtMEOgbq1aJz5mwzKwqolZzzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iDCdRjQT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4596D606A31B
	for <mfd@lists.linux.dev>; Wed,  4 Nov 2026 16:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iDCdRjQT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FED41F000C1;
	Wed,  4 Nov 2026 16:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793808814;
	bh=Uu9UK61ReQTjYdHjAIr88QaMk8bWGQZztS8H4arLM4E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iDCdRjQTeznIpXu9U71b6FmbS89QCUvA+dNwc1kZxQZ2RV0q2vE8kKLOBE9yNNqFf
	 VShh0XB0TJlYZqYeTs8nIh775pUSe5fu1kNfESkeGQmTyMnZAKg1gDdEr7sEhmGFbG
	 wLKIT4pDh9zpR48Jlw7AWa+jXWNWtTJplj2wMhPmPJ7zr+g+e4uhdm45iVSaxy4rrg
	 sGvlxUtS0Ybjqds2I/82eM0iQYnIBmzPT7kyU5QaHsqfOxjJOCH3C4nu0ti5bHo9Is
	 vC2uaT/LRywBkQExRS3a5zheJuHS2OHJi4CQ6cbOE+bVs3xVSpiLLmx4XpOrF7U34C
	 TXPat/xvh9+0A==
Message-ID: <sashiko-outbox-197587@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] mfd: Use named initializers for acpi_device_id
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pawel Zalewski" <pzalewski@thegoodpenguin.co.uk>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261104-acpi-mfd-v2-2-64b9dee3baaf@thegoodpenguin.co.uk>
References: <20261104-acpi-mfd-v2-0-64b9dee3baaf@thegoodpenguin.co.uk>
 <20261104-acpi-mfd-v2-2-64b9dee3baaf@thegoodpenguin.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 16:13:34 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Use a designated initializer for the acpi_device_id fields which makes the
> code more readable and consistent with how lists are initialized in the
> rest of the kernel code base. Also drop explicitly setting fields to 0
> where it is redundant.
>=20
> Unify the list terminator to have a single space between the brackets and
> no trailing comma.
>=20
> Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-acpi-mfd-v=
2-0-64b9dee3baaf@thegoodpenguin.co.uk?part=3D2

