Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795101356;
	b=J4tUqTyoID54k6gOUpxjasnXCPlnhJPjQRaaRc5QNRSxQCcS9ehFgQzaabcjRnIl/6ZL
	 5dihj9O0AItCdnDvBg7n9CGyXixyWksUmWB7i8n4vppx8nKSfGWiOANbI8pJo+JdpRTGA
	 o3Lq3Ph7LhcMwagQn03FMYebKLaJvTPZP0WSw81+ZCtq1WCWoSGuCH514xuSNVlj2EcHE
	 G61+qkKA4jh2SdnC42IMmKaY3PEgCz7znQAN2pfVyrTANrRk4TAAwILxQywoEwgbdW/ZT
	 kYIoAdW7nUw2f9erAc7yrPKsiT3Bx41WQrLK1dePMNgEkAo6MYz8UJoqF25MT82IUXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795101356;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=Gr3scJKYblYt8hkQXGBXS2UVjgDcDlRvwPn5vvgSOJw=;
	b=A/FYROQPD4LX0Hdfr3+tA6KEOd63Or4i5l4KRvwTX3va3DanVSELj19J7gAiD59NE7dY
	 e4P6HgUJ0jT1YB0N+CdkEMKF9PD1N1wZ7Rb4KwyozQHn2wPHMyHx8puytZiBk5HKXJsct
	 SusS51bz/0u0O3wfREJLLlS5vwG8zDNcba8OE8lIwOWWd40YHJfauYSkOretDB6Gb8ANW
	 Rek1MKpT4IerLEW05Q2lapYkGaT3RQYhlY5RWE7Jf4C7C5QxDWoFwW1VPNrFXo6Iw2R0E
	 Gqkb44chteSIjcXWkS3ypxq793uZ59BiXznjVq0fDOZgo3BAgTprAYWx7JvFi9WZ45g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gzOzWPps;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7AC460A261E;
	Thu, 19 Nov 2026 15:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gzOzWPps
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 851811F000C6;
	Thu, 19 Nov 2026 15:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795101356;
	bh=Gr3scJKYblYt8hkQXGBXS2UVjgDcDlRvwPn5vvgSOJw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=gzOzWPpsm+98UFdUenzwQ7Ub9Z+HQ5omuud6nT+PFAAaES+p8OKSB4PBNLLdDnGux
	 K4FhNQwuWhIAz0rRCeHZFPfPr+Zki7W6Nxzseth5fXz3GirKPOynodbowmCqVs/5hN
	 SOIlNGHFwEomONw+950HiSnfL00MwUvAQY7mk7zOz4rEdfBIdBhl14EyZCtCd4gVbQ
	 z7MWfy0XFl6g8LOYWI4Q6MY+xVq11eA3t06KVvsSSW0ao+rdbFxUoYvGWP4u5n5axK
	 WZehRlXhaK7z7mvGM2lD+OWzb473C0Q/Q5K3+gc33WvkjxUXtkCbcm11vk2wrdIdIN
	 Xq6r2GiQakovA==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guodong Xu <guodong.xu@linux.dev>, 
 Wei Xu <xuwei5@hisilicon.com>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20261111-dtbs-hisi-v1-2-6c9f5f80716c@kernel.org>
References: <20261111-dtbs-hisi-v1-2-6c9f5f80716c@kernel.org>
Subject: Re: (subset) [PATCH 02/12] dt-bindings: mfd: Add HiSilicon reboot
 mode syscon schema
Message-Id: <179510135429.60184.5824815095901350208.b4-ty@b4>
Date: Thu, 19 Nov 2026 15:15:54 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Wed, 11 Nov 2026 13:40:12 -0600, Rob Herring (Arm) wrote:
> Add a dedicated schema for the HiSilicon reboot-mode syscon nodes and
> their reboot-mode child device which are missing a specific compatible.

Applied, thanks!

[02/12] dt-bindings: mfd: Add HiSilicon reboot mode syscon schema
        commit: 421399f733ed842d03574ed976802e9d784ada91

--
Lee Jones [李琼斯]

