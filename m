Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990C53CCA12;
	Sun, 26 Jul 2026 16:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785082544; cv=none; b=TRm9AmE4z5gYhVpnh4jrBzQvrZapN+NMTNRh6Z6ETgGPBF/aLjIwHhd4OGn+MjDAWEGLeleDjO9w9L3T436OtvJOwSw/icDkKWyapFXh9Z785UhIEwU+qme/Jx4VKVTz0va2edbGrke4GYdfrlM0Y3kStcMuFwvGvrkaMuiXCr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785082544; c=relaxed/simple;
	bh=tj3OAovRW/PDzXrNrOEpeVyfCwXwFlD9YnjKFWgtYhM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MZl8bSIBK3hBHe1oMnvXoTNxGtzgluO2RJaYdwKnU7RGSXxw/rxElPZ5Zk4KRfmogCCp4tSaBkenDVCdehoODmUlcl7B+/Scv2bBMFkIc4gnLFbQOm+KQ/3nvZfs5vjfLycg19qIIG/VgibFiG3tKMN9E6vhViVd1iS3emYWbOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l4y/uxih; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l4y/uxih"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B9251F000E9;
	Sun, 26 Jul 2026 16:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785082535;
	bh=tj3OAovRW/PDzXrNrOEpeVyfCwXwFlD9YnjKFWgtYhM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l4y/uxihYaojpJ3f7NooyvIpBhgucHPTBP9MFmOve8yt27XZAqvMT8RTV+o+JV1zh
	 O4tVjqT8yjAZnymHpZT20SembpTYP0zhV4+1tXsWYH8hLZprbdFk/kpG+t9hatXyWk
	 shA9VBMGIiZ7+0+1baCWqezttoJIX69ez+j3eBjg2IT0HWUbMNeJDSD/YHrb6uoy6o
	 4xoyBty0qa94ETcFg+RPm0meSi6VNLl2bi16BuhBQkZXDblLcrE0mkrBim6Ny9nuSG
	 4IJvGVa+JQ0xoZOuR+NtFVBeXIKI7Rx63RPA2HasIk7n26ZwWAJ1c65vVrB1WSYLvq
	 HawZA/Rt8XcVg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/9] dt-bindings: clock: stm32: add STM32H7RS RCC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Liu Changjie" <liucj1228@outlook.com>
Cc: robh@kernel.org, lee@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev
In-Reply-To: <MN0PR19MB6091D631C39CED4FA19E2983ACCD2@MN0PR19MB6091.namprd19.prod.outlook.com>
References: <cover.1785080950.git.liucj1228@outlook.com>
 <MN0PR19MB6091D631C39CED4FA19E2983ACCD2@MN0PR19MB6091.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 26 Jul 2026 16:15:32 +0000
Message-Id: <20260726161534.7B9251F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Extend the STM32 RCC binding for STM32H7RS and add its clock and
> reset IDs. First-stage firmware configures the clock tree for
> external-memory execution, so Linux consumes the active tree and
> controls peripheral gates and resets.
>=20
> Signed-off-by: Liu Changjie <liucj1228@outlook.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785080950.gi=
t.liucj1228@outlook.com?part=3D2

