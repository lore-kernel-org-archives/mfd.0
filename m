Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3454C47B423
	for <mfd@lists.linux.dev>; Mon, 14 Sep 2026 14:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789396075; cv=none; b=Zb8GMsK4brGBl/ymE8D1IUt+mpswIlN0YXHdT/BcCpPAeYt452++p60y4RAqcQHXDNhsSwS+M8GiErKvohMlPVEV9CnVr3Lq4Df0alG6a5RiPQ0Z0M3geNP0NdURRjsDD2c+uIfabBssOUWutQQlN9LMnGHFnTqFEN8adoeePNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789396075; c=relaxed/simple;
	bh=fy3Rh4q8a1r9xtb4tWcgqXVOtfZZF7KxfLcuT6TCc+o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZeDQT9gNxIbYILlaeVnquCAlcIoGp+w2UfeCPueFjybDla4/dXaXSAbov3Hc9nM80afGRzpX7BMScKVSjmlN6D+OwqAYOK3/Mu9FBUsBY3S3v5umOo9c7xJMCX1OXrqs18B2xMQDQXGoo6xy/QW5IeGSC13xT6ydf2mWMUFhYIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JGg/xfGO; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JGg/xfGO"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5b6031cbc6bso3249171e87.1
        for <mfd@lists.linux.dev>; Mon, 14 Sep 2026 07:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789396072; x=1790000872; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fy3Rh4q8a1r9xtb4tWcgqXVOtfZZF7KxfLcuT6TCc+o=;
        b=JGg/xfGO/EC9E4zlUwFSapKUIa+Yw8VqcWgAA75aAMdSn3v83XepkLsIwJ5Y86bdkK
         9jvppgUAuyO+UjOIyNN8ISuTk0B4fPl25dlm4NichhEQfUyOVDJDLjaUzYNRiellJTXg
         WNb5ur/H9EDKB1L5NMUmLzOp8Of2J09ABc88lh0Gzz178kXSO2mAHl3O5V2nSoIzRRwU
         yxYje6Xm8aj8UPWzt+FMyo3xXNvbpz88X8KLLCHA+4/REPOwUt30276wLEei/FE6YqP8
         rLm4PbE0YQ4tVoM030Spzd7abjbA0FvsJaas7gz5wpyhHZDK2ok5j0FlgyjNl+yyoQbL
         pG0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789396072; x=1790000872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fy3Rh4q8a1r9xtb4tWcgqXVOtfZZF7KxfLcuT6TCc+o=;
        b=a+HIttU+mc72e+JxM9ox2lirPPscjCM7kZQIP+H2dcMHiBMFfowQTe3zAS1mCBPLQL
         e1JgX9BuV4J9L+GJGRUVfegN1YzwG3/G5/kGQ3VYYa3v+b3/Fjax6C09i8HhRlQCRyeK
         WMz3D1FSC0pWpfYOL6SRnYiLS/TiRc/4d1jlAn3TMXSIm+8touj9otAEs3fk70hodFph
         jwBDSL8gOhd3F9pNby+Kj1s8IRHknKmlAMlpFG+A+UBUJoxazE9i0LPA05FhnW0hrl/k
         Ib5v9huUK8VJniZydstXMmCVMa8xx/no4B8cWBqG9qRm7w0mVpxGqskhrU7viIinZGss
         qs8g==
X-Forwarded-Encrypted: i=1; AKwUvBy4kZnZ8apb7khPszY+R8hkdKrLdY/iDb22xhnu20cUYF5R19TX9XVG4qDtX5YEBLteYss=@lists.linux.dev
X-Gm-Message-State: AFuF++lMI2P5UQD/7xk3rNdwAl/jRMhsUfBEoP2zIThVxoRrcRztywFF
	PWkjyOwUweepvUspWdbw8uW/7d3aRFdH3FtDvJ5s2ME2b1uFWGhtnRs=
X-Gm-Gg: AYBFou132uEwWytNfM3J9Fd5NhM13RJcT5WOgl3qSwLzrtd5mNE5XJsLAUKOL7wZEh6
	fwxEJF4JKchVkForuQVRSecDMzXFFc33KLohAnQdcex0zeqNHFyXYKaNDiWlQiAWbjjz2BkKfyx
	wEknu51H5BdbLN0bVv98qrOTasNztu964uIhMfzJK+I5YCA5moapHCfIy1OZ3L4UI7kTBh5K/DD
	ZVXO3xPDUrmc3L6grxMHnP3sshZOSdpXAFpzS5lXBaRlHe53uAfyyEW1MK+SmcLQmiGrxDTVXrm
	HP8NgjRauOLsc/JPbuSDsL/RJMoe8TCYF8sSoGLH9rq4xd6LbK47vi3T/W38fyMQQZgXhetnV4i
	RbO7ezohE8UmwoeunvYjgw9COhWQRgEUuJlxefb90xRfdIjZT+IWdbZeBXtW9AV0I0n79Ms8gCW
	q0mdyh4j/GM41/xIHeiMwiYegGWIgfjAVIJRKygQxRjT6KIgfFpOPfEybjV3MgvgdQKjk4+UYsX
	bhExRw3zo4nHq7WYRo0Fd9qjnFmMn1l8atQrw8b5RPSwNcW
X-Received: by 2002:a05:6512:15a8:b0:5b6:1783:f0f2 with SMTP id 2adb3069b0e04-5b8ae66304dmr705721e87.13.1789396071748;
        Mon, 14 Sep 2026 07:27:51 -0700 (PDT)
Received: from localhost.localdomain (sekoohaka.ddns.net. [151.243.208.241])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a03a7cb8sm2544114e87.11.2026.09.14.07.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 07:27:51 -0700 (PDT)
From: Maria Lisina <sekoohaka.sarisan@gmail.com>
To: andriy.shevchenko@linux.intel.com
Cc: lee@kernel.org,
	linux-kernel@vger.kernel.org,
	mfd@lists.linux.dev,
	sekoohaka.sarisan@gmail.com
Subject: Re: [PATCH v4] mfd: intel-lpss: Prevent DebugFS messages if it is not initialized
Date: Mon, 14 Sep 2026 19:27:37 +0500
Message-ID: <20260914142737.603133-1-sekoohaka.sarisan@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <aqftQrjT5RtIn-Ax@ashevche-desk.local>
References: <aqftQrjT5RtIn-Ax@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I'm sorry, I didn't notice the part about commit description.

Also I don't really get it how is this dmesg message mandatory
when DebugFS is completely disabled. It makes no sense to me.
If user needs these LTR values for debugging purposes they should
know about DebugFS. In other cases when DebugFS is disabled these
messages shouldn't even appear as these LTR values stored in DebugFS
don't do anything, at least if I remember correctly they aren't used
for any purpose other than debugging while being exposed in DebugFS.
