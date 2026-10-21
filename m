Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792585397;
	b=n5YLwD31Py/79OpkiuwY8BOpyDLxNvRxfT6QEJC5p0jIE/NfekPnOQyXsDkIdLjrD/mS
	 siaDV/wJOV12AmAXSIQWzieKvSPmE5s6/gShFSfjvjLu1RVuPvaVn627cRAiVx/ZZBUL+
	 ATSfEdnbi7bmp09jI9cpLYXV+FgYXpKSQ6JG1sPw2oDyFkb2bhzNcrIUbc/k5RnRo9Gyb
	 /lsuV3XBTNkphtRLR4V6D4FuuzO4CLOHp0vAJlp+8luWlIA6VxyKgrlzItWcBzkJ0foHR
	 2VDid9o5yNTw9TcL+bfk5nZ4QT6WxCRRVMqlCWRNbYhfhzCOcNHSO35gOlEYYxv3hxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792585397;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=lIFvN5Agtdeqy+wFCO0w/xZT6FDBqAGDSq0iNMRrcS8=;
	b=WdN0QHCa0531sUtGMrVSsRmyehp36ou1pn7W0Pkz2T+6sGziyDSnFgwECXhpz2/Z2QMm
	 ouZ++SIMFjUOluVcDSaF+s1mMlC6dBuTZJl57XzjaAjM151Zog2agPIcV12m1WJucCvhu
	 +0hpQMezWl/v2vMt1XZW0DXnwOWYAga5NrXyD+yEbuAPeDRW41BOYZ+Xjbf6QTAljChP7
	 qyYTb+pxG0WncsMAdL346RGI8mCDK74JWo4AQ1bO9mNvdgO3nAKf138zTuUyyg/uzAs8C
	 EOOj01O4jMh0AuowiHweqwExLM3nvg7Sr2jQ6RJbdT1FzAY76A8zx8bkB7ChhjNek9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RR6oJthP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D435606A31A
	for <mfd@lists.linux.dev>; Wed, 21 Oct 2026 12:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RR6oJthP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 454B91F000C4;
	Wed, 21 Oct 2026 12:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792585397;
	bh=lIFvN5Agtdeqy+wFCO0w/xZT6FDBqAGDSq0iNMRrcS8=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=RR6oJthPGp3RZRSOy+aHEeZwDkBnPRByuWVMUWlyxukYe+2uP/Gd0Aeyf3pW4xM2E
	 I6M+Ydsxc/m9I9/BKJx+rPY3noFpY0IMROiL83V6/vCti/idU+IQtQdRV5HAiALCPx
	 CmM4g8ekKGejleo4JD8GLTZKjVnS+MKQOUPsg6hJPvi0u1WEs58YVr1otV5jhBcPVo
	 TP17c288rODVpg9j3ExxowlOWM3gyed5WB1iKKiG3F0N23VDIhnXVs0j74wVlikUK1
	 42/nfUOCLtg3igBf2Ee7DBmy/hJ5fJM+/BW+FX3EBkvX/cPbYgWFtH5yJQ9xk14JJ0
	 ShGW8RsiPLo1w==
Message-ID: <sashiko-outbox-180240@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 22/28] mfd: abx500-core: Unregister device ops on devm
 release
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lee Jones" <lee@kernel.org>, mfd@lists.linux.dev
In-Reply-To: <20261021121245.3111563-22-lee@kernel.org>
References: <20261021121245.3111563-1-lee@kernel.org>
 <20261021121245.3111563-22-lee@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 12:23:16 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> abx500_register_ops() allocates struct abx500_device_entry via
> devm_kzalloc() and links it into the global abx500_list without
> registering a devres cleanup action.  If a caller's probe function
> subsequently fails, devres frees the entry while it remains linked in
> abx500_list, causing use-after-free and list corruption on later
> traversals.
>=20
> Register a devm_add_action_or_reset() callback in abx500_register_ops()
> to remove the entry from abx500_list before devres frees it.
>=20
> Fixes: c211b6b9c014 ("mfd: abx500-core: Convert to managed resources for =
allocating memory")
> Closes: https://sashiko.dev/#/bug/linux-6a9c6b8b-8f89-4af5-8cb1-102822e44=
e6e
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261021121245.3111=
563-1-lee@kernel.org?part=3D22

