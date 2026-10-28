Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793154032;
	b=eW9uSgxsi/H9Lxnz4ejMp7A19xEEQHUlSWloLBeQblaLekK3o7b4eHbkHFh45RmUF1UV
	 cvq58BcZi5AAvrmhkFRoRAWXLhBDyJVCeR5qZKW37mM3g5+wNZ/q6mZW+nr982iJ/qNUx
	 Hmc8ipQOLMq6DbhG+dzCSpbJeacDW2RUDAD5kHHN21tGOFkO+17C2TU3h+zbX7V27Kh/H
	 IIThfwI6cE0Au4fRHQYEH7lSSBY+Js3UcKL/t+2o/4PfiqU1PUCeLYSfJCgpdV/xw576c
	 qN4MInbUHcqfxhC7AtKeV6eKZIw4VUv2Mf3ilwjM1jWRqDhBSlDTGUqZOhmSfmn4Iig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793154032;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=rfeCYPfqUQZbgRE+EblxU4AGx2bN4lYfHOt+AD/YukI=;
	b=tOVVA6twFrkdov2TcGypdaqwJhoqzGWGtnUEKjG6/Xv+haFSCV8zBV8o6klb+Ptd843+
	 yMCgajCmajSmZmG3MoUKhq98XdzjmumpA2C0F3UGZumhmjYDJofkFip6OTgAD2Pxbfr7l
	 8LTtgSaxm1sFHP8LJTJsqg0S9bGPVkxxW+dDOS3dWN0Qu0U2IPWXrfo2yCy5JvgzZ8RQk
	 nKGpztwzJlzZUkFza6y3JqTZaZgXunrYMHkzKkHM3QZLLaazHu25ZWG/xQjcj+KkoqHOT
	 LpVrz455EMrs4ypOTLQia4Spr5MqgkxmpXYrda8/sSNEmf1wK52LpZLSseMpoUoRp3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bj1LB4Zd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0782D606A31A
	for <mfd@lists.linux.dev>; Wed, 28 Oct 2026 02:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bj1LB4Zd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BB471F01825;
	Wed, 28 Oct 2026 02:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793154031;
	bh=rfeCYPfqUQZbgRE+EblxU4AGx2bN4lYfHOt+AD/YukI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bj1LB4Zd9PSD66yuBnJAEqoCbJtnB2PVBsKECmxmRiM+xC3hQvOGzr+Sls2McQbz2
	 WzWJQypE/JUEjCm7QRSJbHMHA8VZHxKZiLpR+5NeVLrykPZsxrSQH336usEzTMkVTe
	 DGFAYK1updGxihSIjsOCjmjlVCRfWaaTT/HV3wSC6xQ2rO1g/TwNIuLeddVxHVXqPE
	 k3tuer/dGA0kZj7+ClKXONUXDI9RuvuY4XBczQj4iDfbhIMtbLZ7fJFEp0qS8sGATO
	 DWuGafzL+24ZP5bBHiKdDYLOrdNcBkRIqLM6YZOJjiXepgm3CocE+C5XJstgM0tvNw
	 S6nljcEeqRdtQ==
Message-ID: <sashiko-outbox-187337@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] mfd: dln2: Clean up dln2_unregister_event_cb() loop
 logic
Reply-To: sashiko-reviews@lists.linux.dev
To: "Riccardo Oliva" <oliva.scorza@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261028021556.11988-1-oliva.scorza@gmail.com>
References: <179198398105.839288.1873130512029656566@kernel.org>
 <20261028021556.11988-1-oliva.scorza@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Oct 2026 02:20:30 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Streamline dln2_unregister_event_cb() by using a dedicated 'entry'
> pointer to store the matching event callback. This removes the need
> for the 'found' boolean flag, restricts the iterator scope, and matches
> the pattern used in dln2_register_event_cb().
>=20
> Assisted-by: coccinelle sparse
> Signed-off-by: Riccardo Oliva <oliva.scorza@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261028021556.1198=
8-1-oliva.scorza@gmail.com?part=3D1

