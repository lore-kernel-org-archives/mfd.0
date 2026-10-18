Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943123BD22E
	for <mfd@lists.linux.dev>; Sun, 18 Oct 2026 16:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792339913; cv=none; b=fdCYDu91/c3vi+POy8hoHeOX8czO7pPHlho8L5yL01USfKmv3fZJmiw+q2KwW6HRxROk7RiaSrdCSU7W0aGHzFdT+O7uFyrle2m/ZA473TC7MTyCBBK4g+aFfMP1bx6Mc4gQcfnZn9wF/1hYYGFxXFINjGDlrlsM7mbMKSRyA0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792339913; c=relaxed/simple;
	bh=M//E8FPGQa5P7x+rD3WNSbaA5THPeU9cjIc9Z1NVsPA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=jiyH40UdxX7dbQ1y85t8Pc6wz9egDJyQUfWZ37nylgJCyoiBRcbQiuGsVJI+xJn/0i0UzsRSwe8pyF0KxB35/UrlmUxG8jiT0TDqHqepvbN+sW0h7axJKg8U0bfzEz4uy4paBF+1fXMAchcZWldtwxUyYUD7Ax+PIdjdqlZH/UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h5jzmjGM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h5jzmjGM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E75731F000C4;
	Sun, 18 Oct 2026 16:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792339912;
	bh=M//E8FPGQa5P7x+rD3WNSbaA5THPeU9cjIc9Z1NVsPA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=h5jzmjGM8JRAbh1KHvbmsuKJjR8S3yIKauaGSsg3q2Tojv3nYMC+2J2vJXPRB4t2e
	 MGh7VTzWf1AElnoOwP7ZtRnCd2ueXRu/cTV80YBxJ0i7eA9ka4QGW5QoGjdgXEWbKN
	 iVqMkW1piCYbNcMfYDVt0aEtZ5GoQ2FjCgJw8zW9oT2UETWsEeYIHNK2O5MsAcif8j
	 T8d+qZSkE8GX55CmXP+HSjrVZU5cWyK+zsPiCIvvhfyh7i8zHZr7AcC54ApuXImhvk
	 AzD1Wq96YMJ6Wvl4vkd9woUs7eooZRr7rkMxxD0OX0YpTulREJioLt37DTSNaaihIc
	 kruhVD6L4ltjQ==
Message-ID: <sashiko-outbox-176265@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 5/8] irqchip/realtek-rtd1319: Add driver for Realtek
 DHC RTD1319 SoC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yu-Chun Lin" <eleanor.lin@realtek.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261018160653.3940371-6-eleanor.lin@realtek.com>
References: <20261018160653.3940371-1-eleanor.lin@realtek.com>
 <20261018160653.3940371-6-eleanor.lin@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 18 Oct 2026 16:11:51 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: James Tai <james.tai@realtek.com>
>=20
> Add support for interrupt controller driver found on Realtek DHC RTD1319
> SoCs.
>=20
> Signed-off-by: James Tai <james.tai@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261018160653.3940=
371-1-eleanor.lin@realtek.com?part=3D5

