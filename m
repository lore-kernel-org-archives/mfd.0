Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0873D51C04C;
	Tue, 22 Sep 2026 10:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790073948; cv=none; b=EM7oYQTXS3LtHfv2VYR0h5YVHUuhUNuxv1ETbprTTRBB8YX5OczyrQQx4KYbjFkIjlFyGptVTueBWLFQN9LQo4NF/67vpVZvw805TAu2ccFHdToOO8kIwzdBL2/R26aRyCwwZ71orZlsfXCLBEayH59FZmt9f6pj4t4jIVTL29g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790073948; c=relaxed/simple;
	bh=DLg+PF8AWVse7q7dpA31G9QuPJY6G3ZNbrMhu00oHEA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Mavo27C/qSfgyYpx3Xb88uKdt2HSPItrZcmAII4czZrZKnHSnIMYUOkhu7Xggc6sdgi65ryZHI6Tl8e7YAo803b8s7dVKPTCKn6phCBLdTRYJUp9PFiwiTuFwmaMdgLYsvyFCAXBBrL1O5xLkD4iQxUsQ7xNFcm1fMSisKOqgL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W36oTAUq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W36oTAUq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A7391F000FF;
	Tue, 22 Sep 2026 10:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790073944;
	bh=nVxyrfCQFPSApsZDSeDL/PcTWxFJTClisSLxR0rtgDQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=W36oTAUqySHqrJrbRof6cciqa7UJKMgRd2Ikp9tca3djn7y3bFzP++AbqfxfcZIG9
	 L6HjAPEqBT3WuVP0AbvDyA7LRaxbxw4sc3KWnk8fYZ2987m0eAAaDhSB9VU0GGk0lN
	 k14gW04kgtrJOMcrJNJcoXXkF5xzvYsyQMwxTxw8hv95rTkc7zy/R9bsktM7Cf7Km5
	 YF6bWxLgsrCUqoxhyMcsSFoOYxrNhxTX70BxS1NVLvdVNm6UNit0usmgBHeRAjja8N
	 jkosByYfGjTQIPwklgpFnZx+1ke7mprq7B9NAVbA4EUe4RIqBGXkaoHKH7kdp8jiP3
	 0Uo5dxsq3HEWw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v20 2/8] i3c: master: Add controller-only device
 operation helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: linux-i3c@lists.infradead.org, robh@kernel.org, mfd@lists.linux.dev, Frank.Li@kernel.org, lee@kernel.org, devicetree@vger.kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, conor+dt@kernel.org
In-Reply-To: <20260922103551.2754613-3-lakshay.piplani@nxp.com>
References: <20260922103551.2754613-1-lakshay.piplani@nxp.com>
 <20260922103551.2754613-3-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 10:45:43 +0000
Message-Id: <20260922104544.4A7391F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> The generic I3C device attach and IBI paths perform both core-level
> bookkeeping and controller-specific operations. An I3C hub, however,
> maintains a logical device descriptor on the virtual downstream bus and
> a separate parent-facing descriptor used by the physical parent
> controller.
>=20
> Add controller-only helpers that invoke the controller callbacks
> without updating the bus device list, address-slot state, or generic IBI
> lifecycle. This allows the hub framework to keep the logical descriptor
> associated with the virtual controller while using a permanent
> parent-facing descriptor for operations handled by the physical
> controller.
>=20
> Add helpers for:
>   - attaching, reattaching, and detaching a device from a controller;
> [ ... ]
> individual controller drivers.
>=20
> Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>
> Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
> Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922103551.2754=
613-1-lakshay.piplani@nxp.com?part=3D2

