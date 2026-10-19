Received: from out-2z4y-a135.jellyfish.systems (out-2z4y-a135.jellyfish.systems [198.54.127.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B19F4534B7
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 07:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.54.127.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792395706; cv=none; b=cINLO0KJAHHZRVefVdg3JJECuD7WVqVMtlr4KDhWhxlkFNnjGlDxyPChLE+JGOBC+QPIdCrtKRsK18ofjLiZjUiwouxe4mn1Zcve+kZlymQh9rFs74JQEe6cm5c53jgtrA6EejIGp4D/uGWl8xGuzOQth7vmYI97xgZNnz+N45s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792395706; c=relaxed/simple;
	bh=8iCy8Dh2ohTt/d+rfWDZv4l8W4e8ADEiqK3sjs2xLB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BvLjZs4f/0SmL3lPTWC8TFrTdA+Ki5uVu6oyELscFHN6Y7l/e5d1GLLxVBeSUGBWQjWCiMsmhPIh72YR34CA7fGs1ZWLtU1SNSENUrB4OB6bQMKMvt8hQQSKAMdLhKPUv/u15+A/9Ws852yrbC5E4I4OiurHgK2UEqdnrfqGWao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gurudas.dev; spf=pass smtp.mailfrom=gurudas.dev; dkim=pass (2048-bit key) header.d=gurudas.dev header.i=@gurudas.dev header.b=jB1NEoLr; arc=none smtp.client-ip=198.54.127.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gurudas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gurudas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gurudas.dev header.i=@gurudas.dev header.b="jB1NEoLr"
Received: from gurudas.dev (107-194-158-19.lightspeed.sntcca.sbcglobal.net [107.194.158.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4j7SCs4fhBz2x99;
	Mon, 19 Oct 2026 07:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gurudas.dev;
	s=spacemail; t=1792395690;
	bh=TDpuGLk4VdS+1BmydS1MckZ+DHA1iY5r82SIQvDgwj4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jB1NEoLrQ7qDs8zGfIte9yrWhmSlN8soRpqyOZGcS9UkrK5kdRPfaaYiHx2+j8Ku7
	 oTCDsD0WRS7pKDoTf608vG11yHFqZYSAPKi8pbqayb5ygGP01f2zXaiBtG8XqzBBQB
	 4wVnBKuurGDqBe2z7YUn+qzS8H8rcWCEfK9X6LCxteuUStZxHhlp2w+4wIqDouAqGz
	 9LqgTrii5U8xBn9OGxos74tcJHkTvsueBVGqIic3KN7F8VWuumSy8kOdVJVBp0dSN8
	 dosFTWH11hHHAubaJsqaCWtlB15X6W/YJdRR/UA/BITo0AJKAdYP6wPeO+IDjZVzc6
	 76Qr1A4SeHB3g==
Date: Mon, 19 Oct 2026 00:41:27 -0700
From: Guru Das Srinagesh <linux@gurudas.dev>
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
	mfd@lists.linux.dev, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
	Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	Oleg Keri <okerixx@gmail.com>
Subject: Re: [PATCH v2 3/7] regulator: qcom-pm8008: Add PM8010 mode support
Message-ID: <atXJp5ct5jANeo0T@gurudas.dev>
References: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
 <20261014-pm8010_i2c_support-v2-3-b395d2b3f668@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-pm8010_i2c_support-v2-3-b395d2b3f668@oss.qualcomm.com>
X-Envelope-From: linux@gurudas.dev

On Wed, Oct 14, 2026 at 04:02:00PM +0530, Jishnu Prakash wrote:
> From: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> 
> Implement set_mode/get_mode support for PM8010 LDOs using the mode
> control and status registers to allow clients to vote for LDO modes.
> Mode voting is not supported in the PM8008 LDOs.
> 
> Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> Tested-by: Oleg Keri <okerixx@gmail.com> # Lenovo Yoga Slim 7x Gen 11 (Glymur)
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> ---
>  drivers/regulator/qcom-pm8008-regulator.c | 75 ++++++++++++++++++++++++++++++-
>  1 file changed, 74 insertions(+), 1 deletion(-)

...

Patches 2 and 3 both say "Add PM8010 mode support" in their subject lines and edit
the same file. Could they either be squashed into one commit or have their subject
lines amended appropriately to better reflect the changes they are making?

Also, patch 3 uses the wrong subject prefix "qcom-pm8008" when git log on the
regulator driver reveals the convention is to use "pm8008".
