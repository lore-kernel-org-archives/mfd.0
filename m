Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9605243C7A4
	for <mfd@lists.linux.dev>; Wed,  7 Oct 2026 09:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791365548; cv=none; b=AyV2qX9RO2zuMMv0FxQJ+BiSWKK86rv/GOrxe7QOQZtaRpx5D3Wp7Vp6+C6Rg6l/D5QAgDZ1NMJOxeBGDEjluKMv0WXwFUnSrxsTAeMTE6kIUpBvs0oXEbcLe/QYvMOIP0y6XZSf/Bl1XWDZVT8WX2RwOgHfiZx++7Vx8kF6qdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791365548; c=relaxed/simple;
	bh=WlieghHMcHZwJW2qJPKMNVD5H25S3Cpb27P3ORS93Hw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=tJgIj5z5KP9yL5Cm7HW5zxLVIqIYiesLVpYvDIGNviU/i7NznSNqKyJspPqIo7C/RqtxQ+pt2jbimEznU36/hRBZJq+GnzGLStFgkzj0bsuRCUQ6k2yyHYcqiYL8dV3q3ZIYkJbnPwaYjBYYIcvgS9Ql+AOV2NI56IHJj7cJO40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mPBNYq4C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mPBNYq4C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C654D1F0089B;
	Wed,  7 Oct 2026 09:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791365531;
	bh=WlieghHMcHZwJW2qJPKMNVD5H25S3Cpb27P3ORS93Hw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mPBNYq4C7WZltK3MWE9TSdAdZf8rrSLOa8lqiLu9pPmLQ5UWiIa1ZkRb13q2plbne
	 taV6iBGX47aq+qH6bxkYojkAUkhvnefJ6pmEzEUI0yXoqMzyT2Qc1ln3AfY+K8tidC
	 DfnLiQNy+Ii3V5sAIwB0DZDUCvJ/TNDubxBORrYKBLXvUGfJUuXEAscQkJuiz8yEGx
	 c7cNjrPUZKe+Hihe4C9pyxpYEx4Gy/eM2XE6mJ/0HPjKJ82D0CcYa3+Y+yNhIF4wtr
	 PxHPZ7ud0noCx7SRPaFdMQpKIlEKC5NyI4rP9dahvx+88dpov0emdm/Fg/mtqJ/WGk
	 hW/2NCBaSOs2A==
Message-ID: <sashiko-outbox-162796@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 09/13] mfd: nct6694: Rename driver to nct6694-usb
Reply-To: sashiko-reviews@lists.linux.dev
To: a0282524688@gmail.com
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20261007092102.3768818-10-a0282524688@gmail.com>
References: <20261007092102.3768818-1-a0282524688@gmail.com>
 <20261007092102.3768818-10-a0282524688@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Oct 2026 09:32:10 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: Ming Yu <a0282524688@gmail.com>
>=20
> Rename nct6694.c to nct6694-usb.c to reflect that it implements the
> USB transport, in preparation for the core and HIF transport added in
> later patches. The module is renamed to nct6694-usb accordingly.
>=20
> No functional change.
>=20
> Signed-off-by: Ming Yu <a0282524688@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261007092102.3768=
818-1-a0282524688@gmail.com?part=3D9

