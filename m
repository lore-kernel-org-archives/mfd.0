Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792585476;
	b=a7XXxG/VzLbIe2B6JDqRVvD/W3coPLKsbm/zOOlnco4W0sbh+ZPDrK0YiI/6RHU6LiAp
	 skoqRclqwNpE/fE31zy+HTYar4zGr0Jxdg9/iiF0nWU5tx9EMdmicQaeMuJ0F0jdNqhEi
	 jnp713WWpYFTqn8gfXRLYQsVQRx/CHtc0wlyL62AlKyQRe6/FHhhz3SKKo5h7fSmGYvBq
	 XJCWkgs7erngCukgOZIKU0kjWgbbc5KAh+ApgmQg9zhl/NWt+SK8MW0CokbLY2UfEJGzU
	 zWz24JcRNML3UHsB4ftIGZFTTA+BV/CWyj44Gj/tcesZz9jZpvfFa1yDSEeJoQlo+rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792585476;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=PiYuPaK1bVXV3503X5ay34xd81OuIKgxeHPMGk6ITBM=;
	b=KQl5jvQACd9Rn2weN+LQlZIYjPWLLRVAhw3OrxoPwTCFV6BtbamrcnaFsQuW+j/dvhPw
	 gW3T3iO6YtIsPjPV6t/0DrmvI2ChWOLJU1cXZIMhOQmzQJYGCTdd7xjuMJhvZmqf4kY22
	 1USzE8+5ZuWpUUbARk85Ce7kIBjxCT1uF5wuqKoCt83kUYVdPZQlmzgq+jcaiYKS0T5vr
	 9heq6Y0wVV24HHASGBV6Q+ID1ISzsH/TAdVwDPb7y1dhZMWJyT4edB2SbvKI5C53ZxXrI
	 XZ+XGcPCj47nZXcHz7g3qHTiiO/fXFlvj0Ni+zrBDsj51Vxn9pRhggWmaQKG/JTDgRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CY7I1u1Z;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78AC6606A31B
	for <mfd@lists.linux.dev>; Wed, 21 Oct 2026 12:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CY7I1u1Z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F18E1F000C4;
	Wed, 21 Oct 2026 12:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792585476;
	bh=PiYuPaK1bVXV3503X5ay34xd81OuIKgxeHPMGk6ITBM=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=CY7I1u1ZJ8Vwx6hXE0CQLrawHZJdaEuxnLVjxR6mCOZNkPycMrcvIxYtfjQR8vboA
	 NswwQlVn2Ks0GrtmnWoCZjV22lv93eiP8jMcLaJJEC+U5IcoWwEgnJH1+ozXlJis06
	 H+u9EH9qwlkZWwyKg5BjlzKU5pGVCWrh9cH9JrLlU0cd9NguMBfxKJZ2tSOj5icbtd
	 GfwDh7p5BCq3BHLUj/qrmig+1MVR/UwnyoPyeB/bMmXfNVJFWRiewnzwm9c6EMKnc2
	 zwKQd/Qcv72dNNtYy6NOQ8FnMRzAP1bhHz2nTbG7jhdMbju81ubBKLAXNtOmngUgK/
	 a5aycBf/Y+PXA==
Message-ID: <sashiko-outbox-180245@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 10/28] mfd: ioc3: Request parent IRQ via request_irq()
 and free before domain removal
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lee Jones" <lee@kernel.org>, mfd@lists.linux.dev
In-Reply-To: <20261021121245.3111563-10-lee@kernel.org>
References: <20261021121245.3111563-1-lee@kernel.org>
 <20261021121245.3111563-10-lee@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 12:24:35 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> ioc3_irq_domain_setup() registers ioc3_irq_handler() as a chained
> interrupt handler using irq_set_chained_handler_and_data(), whilst
> ioc3_mfd_remove() and the ioc3_mfd_probe() error path attempt to tear it
> down with free_irq(ipd->domain_irq, (void *)ipd) after removing the IRQ
> domain.  Because chained handlers bypass the standard irqaction list,
> free_irq() warns and fails to detach ioc3_irq_handler(), leaving a
> dangling handler referencing the freed IRQ domain and driver private
> data.
>=20
> Register ioc3_irq_handler() with request_irq() to match free_irq(),
> dispatch child interrupts via generic_handle_domain_irq_safe(), and free
> the IRQ prior to removing the IRQ domain on teardown.
>=20
> Fixes: 0ce5ebd24d25 ("mfd: ioc3: Add driver for SGI IOC3 chip")
> Closes: https://sashiko.dev/#/bug/linux-81f02420-548c-47cf-bd46-0bdcfb5c1=
738
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021121245.3111=
563-1-lee@kernel.org?part=3D10

