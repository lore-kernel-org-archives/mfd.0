Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EEC237D12E;
	Sun, 26 Jul 2026 16:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785082865; cv=none; b=Kc715D5ke62cdGxFpSbSLriAFOO7hm/c7dPJeaf6JQ7h95/ymvtJZ5lhlT6IBN7TLAxClTzMy6MTUejV74rnwrKyPlJnyWHEyj2PaJQyfXcfgzKgKKulf+rTFwrA0Zv0SBQyqdTps2KMqjxYTfCG7gQ81W5UyvyfI5RTxPdqXFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785082865; c=relaxed/simple;
	bh=JUZzcvGW0Sqv3vqGMzvMVd1DrOXv0jHo3hdSx37EFoo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=h9YioJZeXPL61IjGy/tSC1TABK9+qPmwRBfOp7fro/Jgkp7EZESc188PcpG+l+Qwk/gSmbUrDIXlGxIorm0PmcZHeyURJYS2OqPhunzSyg2Vtj1OKCGB7KdQ9OzHZBh+yGV9nOrxG6jqGcUMLk3buaz/ko8ctUtDQNlj2cHrzgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L1TnAS9P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L1TnAS9P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD2651F000E9;
	Sun, 26 Jul 2026 16:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785082863;
	bh=JUZzcvGW0Sqv3vqGMzvMVd1DrOXv0jHo3hdSx37EFoo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=L1TnAS9Pu36e6nPKMBKHvvMFvYArLCjCv14w1Vppoleajd7MHjmdYREfzWIyIfuw6
	 oRWx0QEZ1+qWjjwyqNPY/QUQ3rINGYtNbzjC3Th+d9ocHsi+ezVGD2AbGV1nYis9f5
	 yaLuWp2WICPIgFf+MW/X3h4E5m5zFFSnJJ5DDkONavhLbrBMnoMX2HzLjEBHXdXU+G
	 cQZPRIecwPcJzdo13YunJunrRhj75OOPxv/wpQbMHC+k5/qDLyWDpMzkWBJBTmLEsI
	 mS+cDPO0Z3ORutaehss6yRHkNVrptIN/10pp1ZHsC21XVt6qE542JEGVSHvVUUI+xg
	 r/dK9mDnsTBvA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND 2/9] dt-bindings: clock: stm32: add STM32H7RS RCC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Liu Changjie" <liucj1228@outlook.com>
Cc: lee@kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <MN0PR19MB6091D3516E29F0A63299FEF7ACCD2@MN0PR19MB6091.namprd19.prod.outlook.com>
References: <MN0PR19MB60912FA1E75E4E55B2E27D34ACCD2@MN0PR19MB6091.namprd19.prod.outlook.com>
 <MN0PR19MB6091D3516E29F0A63299FEF7ACCD2@MN0PR19MB6091.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 26 Jul 2026 16:21:01 +0000
Message-Id: <20260726162102.BD2651F000E9@smtp.kernel.org>
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/MN0PR19MB60912FA1E7=
5E4E55B2E27D34ACCD2@MN0PR19MB6091.namprd19.prod.outlook.com?part=3D2

