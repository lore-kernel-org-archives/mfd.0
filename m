Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794236639;
	b=a706WC2b4Ea961VireJ0xKTUnNCM5ehQyJUL0YCMEUWNgr6HVplL0ncAGNhDSWq+fK/f
	 vViEsF8dc/OVSMTZbLXm7Y/dY4IAHCJ2NI3FbJqDYI9FdOWIH7ozW1oatPeuk3X7evTtc
	 4cFpd9ChmFt3F9oWVOwSWzjBi/g3dgcyGfjVcDJODRZ4TJ7TtbD/rpSzrp6atPTaj97LE
	 f6/n62h1tHJquRWU/Z5NFm2w7d+TolVgoiiHkezRbvm3IO4OIo4pC/JdLDXVGGqB+u1kA
	 zoTkQ+i5Z372tGG0UmS5V6cDdTNk1m5lNFj7KcZpSfhGC0Ng1P130lSDa/fgSB5w1vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794236639;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Rqi5EBIGoeyJcwW/WPNqDUXNt2BvVtoBKoxZeIbEpa4=;
	b=vJ7D0pPdomhqUcwzpb4qcpcClBvtDl84g9/qAegVuvMgj0JR86rotLqMuI6HuQrtrlbu
	 g6jUC6ZlKvZhWC4e9YTvFBBzOodk7NG0eTFluRE+4linP5dJfIGs2QEy+y6DzYyQxthZZ
	 vXYXQcL7dUPdhpsLl/nYSlCRPXH/IfB62rxMst2thrcBmK8LP+FwZ/YxujBCh8Au5wW+Y
	 WRcyPyCUhUz1OfH3NBt37rmRd2AAmYnVX6RYjAG2PJ1yOjXZQZxwu1wQ3HcVB4NG1uYsT
	 hcdNEcDYYw0zT8BYrD6I9gt5QDCh2T2Qp+ZrwF4SeRMiNC0JSa0juh2L4GazA/g2oUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kqlNaUq7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C262B606A325
	for <mfd@lists.linux.dev>; Mon,  9 Nov 2026 15:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kqlNaUq7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13E351F0089F;
	Mon,  9 Nov 2026 15:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794236638;
	bh=Rqi5EBIGoeyJcwW/WPNqDUXNt2BvVtoBKoxZeIbEpa4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kqlNaUq7/tF2MroRw8kzCj25nQQ98b4tAaV2DJiFh81YDVITLkozAdhPuEPQAOxCZ
	 2PyX1+vph6JzLxFWPH8LBsZbl/+avwkXsScPpqOJ0zVHUEZS3F3RB07V+LAX5NUBHP
	 Wjw9QwXlWVfuB+E4yXMh1MLm2KHtSG29Ma6bHVijHegaPgoqX6tJD9gnH1yEVHDt6n
	 YOKIHRKl9Rc+du+AoF+dkmE6f6YXu5EDtIdSGGg2Cm3+8J2Wfr1e7Cl8NOF/HLekoG
	 KctbC+RkEDtbgCdTJSoHJHrFNjsJqdtxOvrw8zL3dN9+pg8EdsqzDuFbXfhaw/XfvB
	 aFKalsHxgjP1A==
Message-ID: <sashiko-outbox-205145@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V3 7/7] power: supply: rk817-charger: Clear full charge
 cal on resume
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261109145833.1363319-8-macroalpha82@gmail.com>
References: <20261109145833.1363319-1-macroalpha82@gmail.com>
 <20261109145833.1363319-8-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 15:03:57 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> From: Chris Morgan <macromorgan@hotmail.com>
>=20
> After suspending, the coulumb counter may be off by a bit. Set the
> cal_soc bit to 0 so that the gauge may be recalibrated again on a
> full charge.
>=20
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109145833.1363=
319-1-macroalpha82@gmail.com?part=3D7

