Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335304DD6F5
	for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 09:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792056549; cv=none; b=ET+UNdpEvhDsP9QqXend582mlxDeOD0pHNoScDFtDsa/5LLZsH8G5a3CMfE7y6aIuoJ1PbJLeHONQMtNvyS5idibKbq1uvNrJxnGutu6/xoYblJd/TN3D/aV+Ix6kBRRGV6AGgi5BAWCTcC8pzUQsGzKsff4h8pd8YP2EGwinzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792056549; c=relaxed/simple;
	bh=e5t9v1QscD4x5Bq/uvBGmyWx9a6c44/YG+Ih8j6KbCY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=uUG2NhrC0u+zndOD0JiC7bvubu0dnfhRGFf/pJpoUkkAIw+511/JkZgm511pF1vl/7eLRM6ibUZxukmUrEsuWPz9yIjo4P6dAgD6uIW+o/nCLCfzPQjdkV6SCSkBXAvSBRG0IQ285TpglbZNuX8R7Za+C2ZzpWubwVnAv0yM20Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fpotaxp+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fpotaxp+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E7AC1F000C4;
	Thu, 15 Oct 2026 09:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792056545;
	bh=e5t9v1QscD4x5Bq/uvBGmyWx9a6c44/YG+Ih8j6KbCY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fpotaxp+xfiN1rpfs29Tt9nV9Ten28vrqjXyOBbhEy/G0Yv3I/4WkqTIglEFQCjkF
	 9n02BDjDy6bHRidTokZw+byC4ID5cCTLAD9/vrssTeeI8XKxpjrEL8vI8ds2B76cDb
	 SeWGnMQYzoNEF8Wx7bKGb84SiVKERIEqihJKbhlizJMx5RO20QJYICl7gPdW+SPzT+
	 xChvYAA4+q8sLaU6m4s+d2jyY35oZDT9vsQcJI5anknKUuLLG4qYVZyeUVvBDjMMcz
	 OXhpC85oq1iW/LSUbcxTT0M7HaQ38/+Wt+dJe+2rbm2FMPYk1AeXC7MFfOfAAm2+o0
	 gKr2kWN5+yqFA==
Message-ID: <sashiko-outbox-172573@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/9] dt-bindings: mfd: qcom,spmi-pmic: add LCDB
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261015-sm8150-display-card-v1-4-5c14928cef29@oss.qualcomm.com>
References: <20261015-sm8150-display-card-v1-0-5c14928cef29@oss.qualcomm.com>
 <20261015-sm8150-display-card-v1-4-5c14928cef29@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 09:29:04 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Allow the LCDB regulator block as a child of the SPMI PMIC node.
>=20
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015-sm8150-dis=
play-card-v1-0-5c14928cef29@oss.qualcomm.com?part=3D4

