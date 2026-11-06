Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793993875;
	b=xRngBpoBdgynUT9EhTmUCjIOKJAbQByLyHR3mTDfuTQpDadhJW9j2vkYOf6vUo/TXvRV
	 hV0QEd7mplDWQaH2Atsugza3EaTqcyd56bnwJXR5jZl4y7YgNCaSXUMEbU8NizKxFvh3T
	 viJwil8waQnaV+IHaUKUTU6+rYk89ujuwKZObrMw6HuZUSbsW1D3CS4SSN23jMv3j6lBH
	 GgF0gt+ztyjZJaJCsVYjKwvnRV/PZlQfiel9fUl5RZfmTnEFf2p2c0Qg8RAMaj7PowUg7
	 yZIaRvDD8w/uDhcOdC240FHiWP3rrGt3tVhF3b4pVkCbJ6eip+oEBDfMKHdx1QPQF/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793993875;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=2R22MKajcPJEkD9y1HwLYhYyiSqKBuv9S3d6jCcb6ho=;
	b=KXqYIxwSfaqApCd0xyN0lEtMkFXCtFugdlaM8S3UdRss+rIR6QtWq2Gh4cfHm5ztyzMe
	 vRD1ZZk4/ej0RZcfmiDGS42jfNshDtm/jmQnTtniEUtqwMDgrx7yqzuBpBEcpTXjnnMRE
	 b5OaNMJwzz05llTCk6uCZMTkUrGlsFMk++0t4e9i0GdChnMtCRad1DqsjasD0vX/mZI8A
	 FwLABzWESI2mW+6Uj5FUIbPe5e9hA2eQe0ljDQ35IOK4Q/lsNZT4Ce5ZsPJXmGCx1lam6
	 MxOFkb2iWYQ+83NDTZ1IRQ8vEYopfkVTF8EtWpY3zwNjwRlDsYF96T7qW8TyjLAKTJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q0dNFp7c;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5B4606A326
	for <mfd@lists.linux.dev>; Fri,  6 Nov 2026 19:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q0dNFp7c
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33FAB1F0089F;
	Fri,  6 Nov 2026 19:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793993874;
	bh=2R22MKajcPJEkD9y1HwLYhYyiSqKBuv9S3d6jCcb6ho=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Q0dNFp7cRVcN8ePojYcaq9Rou7++qpwTg8E3UTsFB5jGfkb6Hcg66cQ680J5S2Pvr
	 8VoRbDa3FEWN7hoHkHC7aX1Zi1A0JNv0I0THjYQMkTun6D2+FzvdwFknWCj/HJs58R
	 ZMPHZCae/Fk10JPpewlzxo45KRa9lmaKWss15dTc9J17eyYKJijReSlKUM5QbNO20e
	 WK5kE5UVpCLwQfP0meHeSVyVntjY3wmgBo5RN5O0iBWlEEKcUst1cj07kr1NTFAraO
	 RPFGnHwoP02ALlLe4ZAW7EVBqzUQTujpudxtJ+4BUWB/tXwfGmRXpKjblYrx5IHQ4I
	 zMFderU9KthTw==
Message-ID: <sashiko-outbox-202157@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/3] platform/chrome: cros_ec: fix alignment of
 ec_params_pwrmon
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Balint" <dbalint@google.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261106193129.43493-2-dbalint@google.com>
References: <20261106193129.43493-1-dbalint@google.com>
 <20261106193129.43493-2-dbalint@google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 19:37:53 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Sync EC_CMD_PWRMON structure padding with ChromeOS EC firmware by adding
> explicit reserved padding to struct ec_params_pwrmon (2-byte union
> alignment) and struct pwrmon_dump_info (4-byte struct size alignment),
> as __ec_align2 and __ec_align4 expand to __packed in Linux.
>=20
> Fixes: b57af7f8d194 ("platform/chrome: cros_ec: Sync host command header =
with EC")
> Signed-off-by: Daniel Balint <dbalint@google.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106193129.4349=
3-1-dbalint@google.com?part=3D1

