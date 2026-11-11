Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794428480;
	b=GW0tPV0bhzJaUE+KVZ3gk73Qjn+Lf4aYYPupNuyEy3uWTO8aPxgcT9LxafpoomBOlJwi
	 +9JxMLS+U4Sli9bn6P80epY1ZIeVFMWmGazLIhAnuoj2HAGPGNA9p46fgRn2JxgxnYp8n
	 MMEUHRR8OKLdD6aWCn6itV/ODSGx2a81CB+69IEZJCOxTKpNesFgUzJIu3LGYY4qZCJth
	 lHeiaDmVcw13vgk+lumF8od3hbyTyJ74495wELlYhUQy3c+PkpJYVQaSf8mLp2769Wrzg
	 lW3/C2T83459ldV/EkzR6wiXtHnLewXkXPRv9o4ZuDRXm7Dmi+pMul7rN7xISQqYQug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794428480;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ZZPvqh7dnjUYeIAQP6IBGEBK+/8GeDl5eXcPG/yt7AQ=;
	b=Q2G5gFknqO2fsLAJpBKfUxZtFkxwOcUz7w6XV+52sq8i3X3uPLkMeuueLmwIBGkkAXyk
	 UZWPT5wUX7tvjHtCDGfx8Q0bh0lEcrbustvtL/DwOrsfFrzMDmmsz9tvr1LqaJk0RF3G5
	 j+4zv1V7+XXhXEILqAqtR4fy2CHZAnCNLqxXtimbjRwFy6KNC328Dy912hnKXsTJU6mY5
	 o23uAnNq1Wc7i3ODPnEOdl4UY8vB3Jhib5/8Lz+Wlgic4waYzT8BKzcuwFhLj0KlagVmK
	 tojYQ+KTmk1ZylC24OBBB9Gfn4CQaHU7VJ8GsMc6QsXPvK2vkbuHGsrnbqRP6NER9tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kLKmM8Hd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96ED3606A321
	for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 20:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kLKmM8Hd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F6561F00A05;
	Wed, 11 Nov 2026 20:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794428480;
	bh=ZZPvqh7dnjUYeIAQP6IBGEBK+/8GeDl5eXcPG/yt7AQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kLKmM8HdaDwxg+HUasA2F1iiNJp2LWmDl+Gu2RLyfs5kkTQ8RFf1GmWc2Ih9IYwwW
	 11X/k8NDyGy/h+9wZs4Eac5dNmiyAUAgCe3WqKthu8y1kLnUn7QSapEy7VdhV8nWQ7
	 oGJfYm/HrBDbw5PtnWk+te4s2PPz6L2bgzmemCL9Zt18EkHfWlTDIzrGsTeec8ieqM
	 mnkN88vNgruS6a/ZZdFsrN0ptBEpnHNq5dpmvu5PF+qbr6tv+UtSdbdJzUq6s6GlxC
	 odGFzO7aiFj+Ovs5TyNXI/bxNn2Z9i40T7LC8KyU/x+6u6Mj3i33rx0bZ+/7R1Kicn
	 T5abhPrCvIUaw==
Message-ID: <sashiko-outbox-209636@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 10/12] arm64: dts: hisilicon: hi6220: Correct I2S
 channel ordering
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?Um9iIEhlcnJpbmcgKEFybSk=?= <robh@kernel.org>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261111-dtbs-hisi-v1-10-6c9f5f80716c@kernel.org>
References: <20261111-dtbs-hisi-v1-0-6c9f5f80716c@kernel.org>
 <20261111-dtbs-hisi-v1-10-6c9f5f80716c@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 20:21:19 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> List the Hi6220 I2S transmit channel before receive, preserving the
> channel-to-name association while matching the binding order.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111-dtbs-hisi-=
v1-0-6c9f5f80716c@kernel.org?part=3D10

