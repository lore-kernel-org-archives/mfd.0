Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F73389118;
	Tue,  1 Sep 2026 20:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788295268; cv=none; b=o3Q3gTG1vCyZePMiCZTm6qmOZGVEYyNaCW+kxA9VCOwRr9ziVIyQ3KdHGAhxZ5x8fh0zNcc5/RnzB1JMmzkWjLJZv/ejroiHRUn6Nn6Eu5pqTSqpoGvLqmXdLmS+lC890cOVQ1vPtTUJ+plAQZkqeooaVmr1vzGkyw8rOJ/cwMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788295268; c=relaxed/simple;
	bh=uS3+PjLNFWhknvoTE2dn6Ckxj3fsHIrt0UV+Z1QrQxU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aZyaJg3XaXXP5ck5ddKRtRwNFbPY5awr8F2APNZxZS12i7qiHk2yUqGJYBaYpt5MIckeuoEoRenPcBVSRQ5dQXOufQPvAiRXb0XAdBNKC7olDhW6xyLJPKp7Y+gvgEpkMqOctrAmMu3BuvZuksy2JNVfiLxBEqbeJ4LTaCVsu2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BCOtRnw1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BCOtRnw1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 156EE1F000E9;
	Tue,  1 Sep 2026 20:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788295267;
	bh=uS3+PjLNFWhknvoTE2dn6Ckxj3fsHIrt0UV+Z1QrQxU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BCOtRnw1zxfMXU3UkATwjuUwmriR2UwW6Jgh30b+7xtTy5CV19Luzey3Dh49E8kVh
	 ZdDZZeN2sAEDcHBX9bzyS6RHFxK5mvG1KaA3GRBD9Fu8n6p1UHVdeiksbTkcHqEewm
	 PFfBL0HuLCfNCes5LuPOmnHpi0D62xP+mcUxcOHqvDGQ99ziN0N4g+PHBHuASGaj29
	 rskaX25cXfvXnd4wYxqui+HcVPfQBovBVR4DRTm5dAxNZG+c63BuBFdvp6oRyzNnrD
	 IvDvSTGJt6f6VKXFQVYFVfvNiqWSxcst9cMyEq/4w0Wd639Usd8767PPFoMa7+6nzP
	 /mE65SaX2aJJg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 12/13] ARM: dts: ux500: Add new AB8500/AB8505
 regulators
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, lee@kernel.org, mfd@lists.linux.dev, conor+dt@kernel.org
In-Reply-To: <20260901-ux500-dts-snowball-regulator-v2-12-fe88b01829bf@kernel.org>
References: <20260901-ux500-dts-snowball-regulator-v2-0-fe88b01829bf@kernel.org>
 <20260901-ux500-dts-snowball-regulator-v2-12-fe88b01829bf@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 20:41:06 +0000
Message-Id: <20260901204107.156EE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Add the newly supported buck converters to the AB8500 and AB8505 device
> tree includes. Use separate, native node names for the AB8500 and AB8505
> rails, including the AB8505 VSAFE, VSMPSC and VSMPSM converters.
>=20
> Give the 1.8 V I/O buck on each variant a common functional label for
> board include files which can be combined with either PMIC.
>=20
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901-ux500-dts-=
snowball-regulator-v2-0-fe88b01829bf@kernel.org?part=3D12

