Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794418399;
	b=0f1O/jFr9IBA72zCVupoeI+QTyUeL62tUu3ryt6S6A2W6wux9XDXKaKO0BriMJKkv6kU
	 gQTowljcs77CWHypbPlQ90jb5pY+BmOXoujkq/P5ayliNRDB0ktHj/3BQPA3hT/sJhAwN
	 qFj8HZ5VrOLaS9evKAWiXMIqC6C4jmTmmYTsY/35k7xPs/uNIWcXKG8g9TnH3YVobheWH
	 yvEFalgmVWkeuqVOsmvVhEy7S/l5hUkYa7Viaf1vX1Vq3wdKpkA7rdu/UaH4PCesi0MVZ
	 Epu6LlxPQGV3Y0JlsKdRk3voZcGui6UNoOm50TMhgGH5wx9vuVTj9RcBtF41xd/nyLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794418399;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=MFkCIflhLqJzT42Hiw6aYVfbKmNIQtdEgc7BIiKvqBI=;
	b=1p3Mgaf9WdiddOk5Jntz5H9pkIj0BaKIFS08vO2xmaesHbSgQN9vLImQiGflLSmMT7Pp
	 6Kynne3yE6E92sBRSpg5xtNvw2PcJqV0CTcyeBGIvsMVfqO4SJWopzcIllaxJ40osg/pb
	 /Tpk5U5dfVmC1WSFanP44cJ5fAUa4XI8V9Fw2E4PRKgsf5cdGJBj4h3XMLfFt6Frt3AD5
	 S9I743VAGlZTACvbia0436HiwEpyu6KjoaIRB9+nZ8oV62J2snDCXqet4tJ+Mkv8NQILb
	 Rfew1yedyuzlxIYFmEzu4x6q5z8hr2ImVH57HcW2fHCIN2H7sypZ92VbQ06jcjBbxAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AyKLXCU9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44382606A31C
	for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 17:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AyKLXCU9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BC2C1F00A05;
	Wed, 11 Nov 2026 17:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794418398;
	bh=MFkCIflhLqJzT42Hiw6aYVfbKmNIQtdEgc7BIiKvqBI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AyKLXCU9Pxqys0rPYYY9WB1g4AXl8uH3lQt2+wFTcCQlMazL64bd4htohRKnXRvsp
	 8X557G/MidLEUKtaWbW+yG6SeBMWzr/TeRHrhhYS5OvcQCT+jp6m3IshpFhmKQIy/F
	 MfBWaLKQTPdTxncvAtlQx/QaKz3JPeKgRYLDCtcUouGukWNtwp9ch2EkRnjP4+WojK
	 vhWARhb2sT3cmvgEsg/waWa5ANKWrDzoNKUYGVe8fo1uC8BDJkaoqqELGiwcFhpTv5
	 sj83LPw0qsSyTnSgo1jNlyDIbChcXgmKE6v7qjdfhNfjsrZnk15Yog1OgvV4y9qmz5
	 tUto0+zJug2MQ==
Message-ID: <sashiko-outbox-209416@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 7/7] zorro: warp mfd: expose the Kickstart slot
 selection
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paolo Pisati" <p.pisati@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261111163735.227286-8-p.pisati@gmail.com>
References: <20261111163735.227286-1-p.pisati@gmail.com>
 <20261111163735.227286-8-p.pisati@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 17:33:18 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> The board keeps several Kickstart images and the ARM boots the 68k from
> the selected one.
>=20
> Writing kickslot makes the ARM reset the machine on the spot. That is
> how the board works, not a crash.
>=20
> Signed-off-by: Paolo Pisati <p.pisati@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111163735.2272=
86-1-p.pisati@gmail.com?part=3D7

