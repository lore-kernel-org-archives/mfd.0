Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3657D4E0207
	for <mfd@lists.linux.dev>; Mon, 28 Sep 2026 15:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790608807; cv=none; b=VM8VnkjEX+KC4vordUClNyehQuwgouNdki8XSlGYaHxpnVh0NI6xt8OBzEtWvTJhabDes4lNA4WhC016E498w/1bVoth5hdtvcEL3lBfNaFnYFxVwiVlu0V3d18dqCHkQQA2fv6CRFbVH0FCumh4lqC1pFwMt1J7BXSCyN9G7SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790608807; c=relaxed/simple;
	bh=KPerGygoJnPN3LyHiHGn4SNKIvJl4KAHPTMcm6474js=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=VmWXjhNwnBdAfe/Hok/HCPqvUPvBicO3CVbroAd6xyuQVmCb/5tAG8SQloVeaMpOTxXPLzKGslunHmhxf3t2vLoVB7eqaZLnSuBqcPW6hBAwRtXrdqnkoxpxpf/sFV7BoriUziXtmaUYHYQZePe3ZfIxjHn4DVfTf3lDpWKqnNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A34JDCXx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A34JDCXx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1B421F000FF;
	Mon, 28 Sep 2026 15:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790608805;
	bh=hTPbygeOb2U3q61Wf9g9Kq8ps05Q9bdq/8BNhpL9cUM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=A34JDCXxeTiwHz5xISJIRdJHLstpdXjIvzxgfvRpwKRIL8MaUiPuYIgGjtWlhatkP
	 mvnLppKpUOH1EKcmotGI/jNwv6ww7gJiG/yIOvzIkhEjO7Jp1KgM8/xB+7aRqHFFHP
	 thMrKfkYRetiY0hMbM0OnTbwXvFZxQe7Eo/x4MLuETb7qAAhWGBJRBEgOCKxhVaMqw
	 R6JgZ+cEJb0K47fQmYDqWp/0hDQ+N77m15rPFjyL5bk+5XZtX5+ycIk6lp57EqAEvS
	 5pSEc7C4JYnaOrHujOAzEnQPOYZ6M689bVLIvS92eDqskvbQZKVf/CYVgjN4MUDa7i
	 RrRsM+fMlQYHg==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, 
 Matthias Goergens <matthias.goergens@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, mfd@lists.linux.dev
In-Reply-To: <20260928105948.2186851-1-matthias.goergens@gmail.com>
References: <20260928105948.2186851-1-matthias.goergens@gmail.com>
Subject: Re: (subset) [PATCH] MAINTAINERS: name the lee/mfd for-mfd-next
 branch
Message-Id: <179060880472.2159410.10465739351137645583.b4-ty@b4>
Date: Mon, 28 Sep 2026 16:20:04 +0100
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Mon, 28 Sep 2026 18:59:48 +0800, Matthias Goergens wrote:
> The T: entries for MULTIFUNCTION DEVICES (MFD) and SYSTEM CONFIGURATION
> (SYSCON) name lee/mfd without a branch.  The repository's HEAD points to
> branch master, which mainline already contains.  linux-next merges the
> for-mfd-next branch of this repository (Next/Trees).  Name that branch
> in both entries.
> 
> 
> [...]

Applied, thanks!

[1/1] MAINTAINERS: name the lee/mfd for-mfd-next branch
      commit: eca76cc1708ea059c5637cfee7c2e38a8a26b843

--
Lee Jones [李琼斯]

