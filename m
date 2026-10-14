Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD654DAF9F
	for <mfd@lists.linux.dev>; Wed, 14 Oct 2026 10:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791972002; cv=none; b=qSTDUdny1k40Vb6EDb1TQCLnevY5/kKkeUnBFXquACWZcCFcwZW1YQTv85xCH2ZRepwAoziUWrTJ7or52xv/oSCJ/5LOohUJUvgTQGlCJ+EHPBxNWsFT1CqSX351RxwaaQoDyL7peIEwqYOi77Z+7JgcOtPE27KCj0WCS4aSmCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791972002; c=relaxed/simple;
	bh=4ts3aRQI66pIxzO6NJ4Q9SJxvtVWYVx+ma61wMcvpR8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Qrm7JxB5E2DCizzRQ+doNZBAALBgX3rF/UCopr1CJT1HKOLugPBZCTjK8nYlkqPK9Z6Wf2k55dynhdhtgCJaBB/vFAWG4BwCUqZiEulEuBkjV5bGmO9xoF3BZ3SLElfTXn+0D0XLebJNE3CWc6DyFh46bN/De9MOFdhpZDI40HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nUJ8EYt5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nUJ8EYt5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17D051F000FF;
	Wed, 14 Oct 2026 10:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791972001;
	bh=4ts3aRQI66pIxzO6NJ4Q9SJxvtVWYVx+ma61wMcvpR8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nUJ8EYt5ixd06CtaHJEElB/9+AsydIkfMfuVr0uiQ35rqolls7PQSVrvUZJFDgXKw
	 Jx8iRthDuIfdwjMWOdILasrOYedv/G/XlSoPF7vaqC+AurUZcuQA9mgM2sfzaUwi7M
	 hSoHVW4CY3p+X7r86KK04eihMTq2RBtmbeNrgsyBD21jZcJykWWuRkMT/jpgTfSp63
	 A+VgYHd67SFZ3S6v+7OFdGH2BBbzAuwwk69BqbiMoOxXMLZk96NRbHgyW0t1xJzs4X
	 E26tOfCXtZg7c8so+4r241sWdqd9Wa8lW8pPoQFl+7eNcHzm4XCsP7Idup3JlbCUyL
	 CSS8CY2QAf4Dg==
Message-ID: <sashiko-outbox-171112@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 5/5] reset: Add BCMBCA block resets through the PMB
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261014-xg6846b-bcmbca-xrdp-reset-v1-5-daf5d177e113@kernel.org>
References: <20261014-xg6846b-bcmbca-xrdp-reset-v1-0-daf5d177e113@kernel.org>
 <20261014-xg6846b-bcmbca-xrdp-reset-v1-5-daf5d177e113@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 10:00:00 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Support BCM6846 XRDP, PCIe and PVTMON resets through the Processor
> Monitor Bus (PMB) of the third generation Platform Management
> Controller (PMC3).
>=20
> Use per-SoC reset groups and sequences with transport serialization.
> Reset XRDP and its Runner cores together to keep their shared SRAM
> Buffer Pool Manager (SBPM) state consistent. Consumers must quiesce
> all affected users, including firmware voltage monitoring for PVTMON.
>=20
> Power-cycle resets for USB2, WAN, PERIPH, MEMC, BIU and BIU PLL were
> considered but left out. These belong in power-domain and platform
> power-management abstractions, which can coordinate affected users.
>=20
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014-xg6846b-bc=
mbca-xrdp-reset-v1-0-daf5d177e113@kernel.org?part=3D5

