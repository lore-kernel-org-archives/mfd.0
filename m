Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795529129;
	b=XU3hBg23wnbMg4KB0CYg8APqiEfuUZcoLtbNeOe12EvrsCqJ7bMwdCD90wxK07U7MQt+
	 F99yNiNVOz8/BOKB6xGaQyP+/cRSwBFjYQ35UHVnIuULpdY3A/9z7qk24ZDSJuuhIAfMw
	 nvxlU8okQ5s6lzqYAarBK/ypJyWazwdr+jbagyoVrMsRQSYWrNxePJdqdbNlGGSlRwbOl
	 ByFSm5NzLt0lm/jEZOifUc0LM+hNV7cXRXHxwgk4P5RsaRoUAeQ8DORy5lORJjWqUQ+zo
	 D3okGadhmRhjFEDniNWU3WXG7dIJZRWMzJHlQlfePgxEvLEfzBjYZ/B5Kj+JA33nurA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795529129;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=NL6gAZyKPjI/1Rs6zaMRbnUZYiNUZ9GSLFws8YTj4ho=;
	b=w9LplIKFk4WVmcyjF11ZlueF3Kr8XkGcjEibPqjxv/5qOJ/aOVGUK63wf4bhzYjqrTuw
	 5NUGLn9DhmdcMlDyivw6Woj+YbrtTMan9ayMBwdMWeVSEvm2O9upaTR1EtVcImXp9FCQ2
	 LRYL1W80nWQit6TqLF3c+gZAkFJYQojuRe2JV/u28eBH+w+/lL4CwJFWGeQzbkBCBfx+J
	 Y43X3UIplnrpMHnz+PnW6nBEOstbfK5oKL/0WKDV241KbNAujQy9VICNNchwrjBy4+FTi
	 OxJjh49bk2HrfaroZDWfIeETXYIqwPo4coBQ4+S1x5nKFk6BPc+wTEN8/S+sXx3eUEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Qgkvns/K";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1F3606A336
	for <mfd@lists.linux.dev>; Tue, 24 Nov 2026 14:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qgkvns/K
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05D311F000D3;
	Tue, 24 Nov 2026 14:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795529128;
	bh=NL6gAZyKPjI/1Rs6zaMRbnUZYiNUZ9GSLFws8YTj4ho=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Qgkvns/KjSWyDUzGADY20cXPgm0XxLpuKdC/SB6u+3oN2l4o9nJ3pBFxM8FxJLbC+
	 cCQycLIzaK+nVz8pbfQWOT8krvlxUA9U6+UgoG+K1GgoeuXNZfYiROG4voWTbnvl+L
	 MTtKDTZ76ihJ+BnvLgzvP9YqSAFL24N1M39+DphZQIy6i+VL+g20r0IpzJEUTbHGfU
	 53loHOdzS+LqwbR47t2l8W9iZsrh5x/mL8J9ZjRogQzXyNBa9fK/52T9T9NeuULqxO
	 1Lk7fv+5mrTVXf6mV2/sp4n7PJ0uRcYkFx9dnzvIsZc/NKVl7VrBmVhXgXWk5jYeXs
	 T0hn1yfZr+PYw==
Message-ID: <sashiko-outbox-231298@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] mfd: palmas: Fix potential IRQ action leaks on
 removal
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guangshuo Li" <liguangshuo@mail.sdu.edu.cn>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261124135836.2275740-1-liguangshuo@mail.sdu.edu.cn>
References: <20261124135836.2275740-1-liguangshuo@mail.sdu.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 14:05:27 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> The remove callback deletes the IRQ chip before managed OF children
> are removed. Their later free_irq() calls cannot find the disposed IRQ
> descriptors, potentially leaking interrupt actions.
>=20
> Use managed registration for the IRQ chip and auxiliary I2C clients so
> the children are removed first. Manage the power-off handler cleanup
> as well and drop the remove callback and explicit error unwinding.
>=20
> This issue was found by our static analysis tool under development.
>=20
> Fixes: 124e9deb1c40 ("mfd: palmas: Use devm_of_platform_populate()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124135836.2275=
740-1-liguangshuo@mail.sdu.edu.cn?part=3D1
