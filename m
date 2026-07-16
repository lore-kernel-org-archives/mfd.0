Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AECD53C3F71;
	Thu, 16 Jul 2026 21:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784238654; cv=none; b=EDSJNCZ1kmJYj+VhK7gts1uCp870zhBs8EqfzZznYHmhqPd543lwr9nDPw2lD7AN3IbVDXmTbaB91a6ZwIW93LEB4jJidRsaxO/BH3JMjNOpbMhEC6Teju4zsxirR73gjm6AVpWLhz6orQFSIZL7okKW+alkpQpQ4ZFH597oB28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784238654; c=relaxed/simple;
	bh=EL6Grym8RPD7YPg6yzkBRjhZWqF0yiUYfuijgsmXy6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cn0k1Rx+mSLBdLUiiVRodiEGNEyUqDla0ZLeEs5nCkCNuV9TF3AZ+7rY+PMdxQy54tG7Q4+4qo5hnOcm82RxpTXPscgGAinxRfZIhrTfs2I97IaUQumE4fAccT72xPWcU4T1lpRjWcJJydQ4k8pSKt2rmxsxIttWfvDONsaKWpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gO5UsTha; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gO5UsTha"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 308BE1F000E9;
	Thu, 16 Jul 2026 21:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784238653;
	bh=3OsH13MWC4WHZ+ocmqqtbJaZiPluodQxwWqUg00JFqc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gO5UsTha6BWpDIGRkU4Q0JmhVu96gz/M76KRKFUeoFvKlQ6i3fZJWCQ7Amr1tMj8F
	 X1j8XusFnhNnMxs4m98C6wuGPUfdjjGfDN/0MdgC/MnNbOh7bDWCCUDf3hn+MeCXEK
	 anW3xcVnlpYMeFE500Sutn43gdjfFDtDCJ7qxh+ED7TxinWMqD60LAxiXYBYpoLWPI
	 yxGxViFf4TArtrTdFr5Xc/T9tOQe8lOF3UY+fM+FUxgRZ/QHdVsA7GmSbhM8Zs43v9
	 JIBTgfiZpkhrQ1yaY9/FD+cNaklWZ+RRNRE/hpzDzq49j/kbW8cc2BDXcZpyPhSigE
	 /Bz3yRo8hDb2A==
Date: Thu, 16 Jul 2026 16:50:52 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Eduard Bostina <egbostina@gmail.com>
Cc: mfd@lists.linux.dev, Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org, simona.toaca@nxp.com,
	goledhruva@gmail.com, devicetree@vger.kernel.org,
	daniel.baluta@nxp.com, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	m-chawdhry@ti.com, Lee Jones <lee@kernel.org>
Subject: Re: [PATCH] dt-bindings: mfd: Convert OMAP USB TLL to DT schema
Message-ID: <178423865216.1491377.2197049807658429280.robh@kernel.org>
References: <20260708123328.1768794-1-egbostina@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708123328.1768794-1-egbostina@gmail.com>


On Wed, 08 Jul 2026 12:33:28 +0000, Eduard Bostina wrote:
> Convert the OMAP HS USB Host TLL bindings to DT schema.
> 
> During the conversion, ti,hwmods has been made optional to resolve
> dtbs_check warnings. Modern OMAP platforms do not require this
> property, but it is still required for older platforms.
> 
> Signed-off-by: Eduard Bostina <egbostina@gmail.com>
> ---
>  .../devicetree/bindings/mfd/omap-usb-tll.txt  | 27 ----------
>  .../devicetree/bindings/mfd/ti,usbhs-tll.yaml | 53 +++++++++++++++++++
>  2 files changed, 53 insertions(+), 27 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mfd/omap-usb-tll.txt
>  create mode 100644 Documentation/devicetree/bindings/mfd/ti,usbhs-tll.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

