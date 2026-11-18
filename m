Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794990616;
	b=ZEzyXI5ZPmkQefXykNCpHdmK7ZLEAGXxj8stCHJJqdFNSX+fJN+uoel0nnJqUceXwZwx
	 rCD8/Q1ygQKIkA1g2j8iJL74gkh0P1jCO3jxxIfmza3uc1lp8RQJyKXVU6mFqwz0xfx8v
	 Hc6zK9t/65i2FdUMH7xplvSzb77yh0QmNsLma9MLCUVJ+i1RYsDk5bBD8MI19R+9QmbF7
	 bhFhxx/pA1GGOd+7zbIPOf1NwYqel6u9IOU2wzEaaiZ7Hj0gu0UuUPMIu5BZB+jpHKAgC
	 OiuDUhTGrUsiV2877PYS+6i1S8b1hsQ6rtPL99xXllITNTq/pmkAG2qwe9OeOVjenCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794990616;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=mXis9j2e5iafZQow7PSzx7Yex6SKrkj7E0OjzN0sA5E=;
	b=ExrrDi9vpjsrHyejv0G/QNCzl+9c6wFU79mjwTMK3V7AvGL7FJ+++9ZdXGBepHYP5yIJ
	 E1gDnmR8s+wwXzDHpae27WLkjMRvOJfiL7wtzQ106GzNU3G6BajHVX7lRpmo6bZg5M4RE
	 asQvxwREWONZzIlgNpEF45FtQYVvbulovvMW1OUSdDvSwqAlO0K1wqMAJjTdKEceBIWl6
	 Xdf/3bHhmUL0moO+0nQE591FjC/E3s7jhDi3rne7zPw2ADkaGG9hgMYKsyLs4tz/xPjbg
	 91SelOhPujTr0v8PWKRAR6o7z7PsU66Nr+fLllh+ejvmWLDtQM7mQWu31g3pLLcjTng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ognOSu7m;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F90606A31C
	for <mfd@lists.linux.dev>; Wed, 18 Nov 2026 08:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ognOSu7m
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90F611F000C5;
	Wed, 18 Nov 2026 08:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794990615;
	bh=mXis9j2e5iafZQow7PSzx7Yex6SKrkj7E0OjzN0sA5E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ognOSu7mq/wisDw0ibKxiZjk8jDuzS56p/1nUj1ZQtYSrNtG6UM+SpHUeF+3ZozFi
	 XhmuSyo4yFgukUUH2Vp2Tv8Lh0H76Nk1IQ33vAo+yKbANFTKRtxf/Kzam+sExS7Ykx
	 3hDZ7MrSR9ziXz9VchhpQ55WpfiNYgQJFS1AZjLzhpNX2WgHtmfgoX4fM7ljdqJPhf
	 FwDDMkEMU88IDoQoy77WVWbZK3jZn2k/+wdO9RfMsLTbrRb+qp/8Fos1PubrGwDkM8
	 0nh3bSI1GnkrcmEx+G8EKkkQod0YlnNHnZgrKtlOcdw1ccOyDNrvO+JIwfSuEL6kFy
	 9OuTrcoJwahDg==
Message-ID: <sashiko-outbox-220451@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 05/13] mfd: nct6694: Drop the unused IRQ enable mask
Reply-To: sashiko-reviews@lists.linux.dev
To: a0282524688@gmail.com
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261118081625.2399247-6-a0282524688@gmail.com>
References: <20261118081625.2399247-1-a0282524688@gmail.com>
 <20261118081625.2399247-6-a0282524688@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 08:30:15 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> From: Ming Yu <a0282524688@gmail.com>
>=20
> The .irq_enable and .irq_disable callbacks only update the irq_enable
> bitmask under irq_lock, which is a spinlock_t. Nothing ever reads that
> bitmask, so the callbacks do not mask anything. They also take irq_lock
> while the IRQ core holds desc->lock, a raw spinlock. On PREEMPT_RT this
> is an invalid wait context.
>=20
> Remove both callbacks, along with irq_enable and irq_lock, and keep
> IRQCHIP_SKIP_SET_WAKE. Without .irq_disable, the IRQ core falls back to
> lazy disable, and handle_simple_irq() keeps a disabled interrupt pending
> instead of calling its handler. The behaviour is therefore unchanged.
>=20
> Fixes: 51dad33ede63 ("mfd: Add core driver for Nuvoton NCT6694")
> Signed-off-by: Ming Yu <a0282524688@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118081625.2399=
247-1-a0282524688@gmail.com?part=3D5

