Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C811372B5A;
	Sun, 27 Sep 2026 16:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790525197; cv=none; b=c+kIHlT0iCIbiIFow8Dc7mTuvvVqVfgqyzGTL2olci5POjvdtgS5wIkurY+I1hJm1q+YF+GObUC4kgGLDFQFSVbIpRzBEeIgLTvh73Mw7jq61/fz3UmlekicNiT9WdKV1BfttSc4MtWy07kXdyRmDfBnMRnH4P9OUHv7W5vRLJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790525197; c=relaxed/simple;
	bh=Vu9zkC7UAFK89bCF24oD31I2sW2sR7Ga3RKRZO0882o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CwXaHQhUVYoVMw/6MrKitFGK0AtnOMHil+XbwCj8YKtIcIttW+YADBdPVqniLFY46wDtArxWoYPqD7DzeA0aIzaXDMadkfrN+isMK6l1kosQsKwX5IYpDtJw2/O5d3mDw5NG8cCL5l8spWSnOrhb4B1FoYO0JDPqbGJxYzueDuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Am7gLAV/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Am7gLAV/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0EBD1F000FF;
	Sun, 27 Sep 2026 16:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790525196;
	bh=Vu9zkC7UAFK89bCF24oD31I2sW2sR7Ga3RKRZO0882o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Am7gLAV/zp4mMQGs7Dml2cmkIrtdlS36Kij0Gnc7eWcKcLSQ9GF5l1RtpdcUnJu4c
	 rt0Nu7dp9cF/Jo/BuF9fIwOpYMIO/JrYhg12gwdzLiidtDiy//L3NCr+j970brCxBl
	 mbUuvXtN5/KyasBMRCbBw+Im4l7b2naANxXtbcEkr2WZGsAz3yXQF6JwT0M/rIyEdS
	 5QiNSrsadT9ZM7vwvK/rRMw0aelvF7xMuZbQNAiVrfbzh2YSBSCiePmEOh9jhs8/Lx
	 vl+R7fUJ807/xYmcC2M7xOt2UmOqCY5E4t2/812k8J5Ky/Q9KfP7mxPtke5gduVMzw
	 VJ0CL3I1U9lBA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/3] mfd: max8907: Remove platform_data based probing
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, lee@kernel.org, mfd@lists.linux.dev, devicetree@vger.kernel.org
In-Reply-To: <20260927155745.187758-3-clamor95@gmail.com>
References: <20260927155745.187758-1-clamor95@gmail.com>
 <20260927155745.187758-3-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 27 Sep 2026 16:06:35 +0000
Message-Id: <20260927160635.D0EBD1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> There are no in-tree users of this driver, but it supports devicetree
> based probing, which means external dtb files may exist that work with
> this.
>=20
> Remove the unused legacy code and make this a DT-only driver.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260927155745.1877=
58-1-clamor95@gmail.com?part=3D2

