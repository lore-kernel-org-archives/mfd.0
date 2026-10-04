Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5534766AC
	for <mfd@lists.linux.dev>; Sun,  4 Oct 2026 17:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791136511; cv=none; b=kI0uyTCeGmPDPr9EFAUOOn4cf+qGB7CefS1eLMbbEePI1Jp3lioetLzUdffA5E5R+zeUH0P8eOLquoRifKD1Pg43U910vqnpHhFYOFA+IKdF0VC15JnN9HpQA8WMmHX7O5G1iCFfy3GcJ7Yftm8HSQVVSr77O+UuHEF3D9PWReM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791136511; c=relaxed/simple;
	bh=TCnKZKMvPLHI7axFLcc9eKspWxu//6Bd6UvOR5F6H/0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WN4Q/9ev0czCYDYSNRZ29GMriGE7BruddN2XkZb4ERCP8rbINrI77HKGNCkoTiHgdolIArHp0wXxGcIdtzCvrU1q9EfP2aau58i+SzdEF1kzNgQEYl+LvXhBzSt+RHbe207B3qu1+Jp+k+aUDf20eo/rY9hLFd+U+2EpNke/gH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PfWp0VdH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PfWp0VdH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 010381F000FF;
	Sun,  4 Oct 2026 17:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791136497;
	bh=TCnKZKMvPLHI7axFLcc9eKspWxu//6Bd6UvOR5F6H/0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PfWp0VdHxObaxm4IzlGi5stFMDyeRRGwqenmY1/l5ejJmT7iq0Iu/Nv+1aim0yg6K
	 lL1Oe4aEAdxFHHEAxFIhGLJ5fVwF9RoWNs/zS5Fux+TQ472vEqL5GJViyVzvtk7eco
	 YNNoxSRi2bHTQ2CTKBB2bumGwzBemG5ke6D4wm3WBprOYnGCtOtAZcNRtJFom+MsdM
	 JQBT9AviMdDSyxdG+8KUtXlbYOuCsBR6XZ2hgVel843ZQoZfu9qQC9tBjTPxwx460n
	 Dd31c1dKGiV303Z7av1+NMiSq2K6zKEOH9HQ6MufGPr8y+ov6AQBLt8R+HyiOApLrl
	 sd3JkJ60OiDAA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] mfd: rz-mtu3: Enable runtime PM
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cosmin Tanislav" <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261004174024.502949-4-cosmin-gabriel.tanislav.xa@renesas.com>
References: <20261004174024.502949-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20261004174024.502949-4-cosmin-gabriel.tanislav.xa@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 04 Oct 2026 17:54:56 +0000
Message-Id: <20261004175457.010381F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> The MTU3 child devices use runtime PM, but the PM domain is attached to
> the parent MFD device rather than to the individual child devices, and
> the child devices open-code their own clock handling instead of using
> the PM domain logic.
>=20
> Enable runtime PM on the parent device so runtime PM usage by the child
> devices can propagate to the parent.
>=20
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261004174024.5029=
49-1-cosmin-gabriel.tanislav.xa@renesas.com?part=3D3

