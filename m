Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794734127;
	b=o9LxSF1z3hupUMvAm3a7dqcMpLdSnKqoqes+ifLs/v/vFMp1etalD1joAjZweAu9kVCY
	 TFOYdO6Ga+oJjH8Q0l1wx7qfn5giA2bw+1Y3RqqgZ7wjWWtC4ZsEk7sGj1mxxEL/JfLBU
	 iFO2Jdu/Ly+OtyQlbjJWC4Lg2DcGtukuWCKSncH7bUVXZVFPzGbNCFMsCYKm5UBR8a62B
	 cc8ci0T2O/nadR/E2izOOjYLDL70g4TUiCLiPymAxa3kjtk7h5moAcoJmlBQm5XSNRLg3
	 KsA7o1A9mkn/aHunr1NLXRZumlbzvFlXkj4oPcSuYydtLBrkGeCYTZQ3kZRoWSo8tSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794734127;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=WZAVnogOq4W64B4M5w1fsl/Z9Tpf72MNdnTJY4ux2g8=;
	b=DJA91P6RG0Mx+l6V9CCPMm7AnvkjLQYOxbTLE0XlaaKFjm0kjkJyxsMFgBmDUkTni19Y
	 Xmt49lc7jwSxkoP0cruKvTLvoChqZ4/Y5nJcPqAQ3/K5VFu4jZat1IPuuzsp3a18N9tTX
	 rHvSLZvauj2yn+hsmLHDlf+z6rk+7wQNG2dufTVY7CmJgKx5kcydPibgeuWbK02FBFN2r
	 sfYkEZtDhLcdaROWUK7pKff7QlL94zz1+6szHftkdIlxkxDMT64nzgOqEtstncEdkXzzz
	 +k6xJ8bLqsBslCd7nKiSdUKJrP1AQGu0BfdKbzHUR+blccPXwpu8Yht2vfxL66kRA2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N2EDfmpd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF149606A330
	for <mfd@lists.linux.dev>; Sun, 15 Nov 2026 09:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N2EDfmpd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 062F21F000C5;
	Sun, 15 Nov 2026 09:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794734127;
	bh=WZAVnogOq4W64B4M5w1fsl/Z9Tpf72MNdnTJY4ux2g8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=N2EDfmpdQuS2ia/rLt4zXWfzH1se0VYCV1ejAC1PjCeUxmkmT8FzpzjC0qrMAN3RQ
	 10RUB77NIHnTLVV7tvk/NHYS5u9dGDhFFs4lTK0YwI1FNHdFrIzN/42s7ZFdYRiDYf
	 SEPY4gsu2wJxopAg1XCa6bcMylMqo7SJSy95Gc/HCyq/znYzm9b702FqRCyOARa/0t
	 2HpTqROr2zU9FQxFodU8WyXl+j+jbpLHeNR9MooRtBVQTgfmat29HdpQ7p19xTq/CP
	 j8kVP+r9Q2jNI0KnX/fpu7kofxDTa5DxP6n+q3le47be8GRkxBdrYGSpI/Knv5/1aO
	 eWKjnzi+UyoSw==
Message-ID: <sashiko-outbox-215335@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/5] mfd: max8907: Remove platform_data based probing
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261115090147.95337-3-clamor95@gmail.com>
References: <20261115090147.95337-1-clamor95@gmail.com>
 <20261115090147.95337-3-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 09:15:26 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> There are no in-tree users of this driver, but it supports devicetree
> based probing, which means external dtb files may exist that work with
> this.
>=20
> Remove the unused legacy code and make this a DT-only driver.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261115090147.9533=
7-1-clamor95@gmail.com?part=3D2

