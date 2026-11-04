Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793808734;
	b=3L1iLO5AxeZBa2urFGPkrzma9L1tOi4LImibvu/M+jJvSOWRfcp89FBtVgKviQnE7Xth
	 j2rCw99NpCgzRQ6D8J49r/5DB26bXVhvxSVyI9qHmpdQIO1hS7wTLJD/w9p7011gi8yyY
	 hjdPygwLy4VOXqmCFUumk8hPXKPeim+2i9wpT9WRQIp3HbZQRyMNXA5fUpNXc9rNoQSj4
	 WU3ev6iTFjnSUDzP6DrDfcxgHmeweCdcj52m9+rbu+EfKeyLOmd71Mn0rFsJEiTrXrBQV
	 J6mK6i2A+MTNChtvgq+3iVLNd2AwPgFzi0EolzAPZ149inPDWyVfgCkATF+ZyVHPeqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793808734;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=LJpDKErFtLkZIW2i8WIsGhwjo5nN8Ya8oH8Ja7zTDv4=;
	b=oHqJdzo41aiOb8EPXdP9+1AQXRCTZTVRncUFcDtH4cqoKSMC5YT0X3SOi3vW7XPLi5vr
	 80aG5Zedr87GgwwCVvguQFgRhEsXL9Mabtoyj2WEJnSq+tYUaQY/MDPLAIiAzUReMqWwd
	 bxoTuTztSbIKNLcYqKBlU2XHvVH/iWbd3c5F6bJJzdP3NmfVHtmwGnYkCJzPipIWqfXt8
	 sdMf6DPo22IqCiwsCZHJ1l0csSKMN/4GdWs5hcptMeXbWop1z9XdDlRPsRtax4nje7tDm
	 kWNy2MFvRmZf3OlmUE7BKp+vDyUdqjk+EflGQFMbixi7+a+wAvbD4oRMsU881T4iCCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fZuN2v9h;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC509606A31B
	for <mfd@lists.linux.dev>; Wed,  4 Nov 2026 16:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fZuN2v9h
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EBAF1F000C1;
	Wed,  4 Nov 2026 16:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793808733;
	bh=LJpDKErFtLkZIW2i8WIsGhwjo5nN8Ya8oH8Ja7zTDv4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fZuN2v9h7gex6SXpGaemnn/7fBRSfhtbCY2qUwYu33sTrCsBzFM5AtIlNIOAOtJrs
	 /p/SM9S6W3iY3ti4DzLthdpl5EG9YLcuubd6tZC29iJRB2GKoEgjv+ZMzl8d+/u0VX
	 w7H/cbvpXLgjTZ1FgCt29jRlpK8CUtaBSD7ZIzrXCk7QIHmceoDTBVYHRfkpLb1x3q
	 b8ktraUCV/Gr0IhBdNcNpo9YPIpcCLcL95UKwPpeSYQwrArySkemKiAaOlIhzRd8I5
	 kSALTzG6FBFbvhMm3UHj5bnOOGvupX882Z+cH+40e/7cFvQ7TJa+GedBjfk2PFEve3
	 NSgzSkMFSlj3Q==
Message-ID: <sashiko-outbox-197584@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] mfd: intel-lpss-acpi: Use named initializers for
 acpi_device_id
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pawel Zalewski" <pzalewski@thegoodpenguin.co.uk>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261104-acpi-mfd-v2-1-64b9dee3baaf@thegoodpenguin.co.uk>
References: <20261104-acpi-mfd-v2-0-64b9dee3baaf@thegoodpenguin.co.uk>
 <20261104-acpi-mfd-v2-1-64b9dee3baaf@thegoodpenguin.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 16:12:12 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Use a designated initializer for the acpi_device_id fields which makes the
> code more readable and consistent with how lists are initialized in the
> rest of the kernel code base.
>=20
> Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-acpi-mfd-v=
2-0-64b9dee3baaf@thegoodpenguin.co.uk?part=3D1

