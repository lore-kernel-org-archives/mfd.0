Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A52251AECC
	for <mfd@lists.linux.dev>; Fri, 18 Sep 2026 16:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789750370; cv=none; b=GIhcgkbem7gnvCC4IuVOwSe54LXWX6meaw5MPhsCBdtXIa1JUOXm6RZxxTPcl+mwnP1Qqmi9wTBeyHK2RK4wbupzWrb5YK/LtX+sc4gHgKFiSCwIUKtuWdkfFqRZ3GORemXXwFhcIyKWibeWbdfMBWRpjaIdyPJbXmNz5cvLwZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789750370; c=relaxed/simple;
	bh=irc5KYR38IOfRRboX+pEvk8I8NbKQWukGj6S5mf7trQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S2RSmCEPJyOXOcsZhl7sF0OhsvOH8ysm/r6WoFGxDImWlNA6oX5LgjThMMU8qlNoHKsabI0Ua9eQf2dVZcynrTEl2n46Bw9+Uki/J9OhT7vA4TPwJ9SFGJMPMnk7yH0wK6GS96vLqm+uPZ9OeBhN1fz41deb57V/5j7ZMS3IvKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=XXg5r+9i; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="XXg5r+9i"
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-939109f067fso122730085a.2
        for <mfd@lists.linux.dev>; Fri, 18 Sep 2026 09:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1789750364; x=1790355164; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y6nMczNQ3DZBT2HE1Ncd8RUTZxVgA7izY3+gfm5mgsI=;
        b=XXg5r+9iRgUJlK/oauaYvIn3G8UmFQOmPVXpe/8v+tkMb7E0C6Q8PHT2/vOcDLb26W
         12CcRE8icEvw2Ll2PV1S/rRzlwsoqRYrCCyZKhiDYWcHCYT4GD4awgQGIGWZMVLKfZmV
         xKcOJLQ3C92Zp3PBfWDw7y223gCNiIPKlThjHGClmM7UFJ8Z7ql1+v8fMesKA36PTbGf
         W9f3IpO/zyT/O4FbMq/ekgcoXNMFJ4typTrW14lwSvmUwICjz2vee7pgaWvOHmUAm1E8
         LpThImFyV8LC3M4IKIzHIGDWEgk5wOIPMQeUxMIprW693pi+XmFbp+qMXziyvfevgEYi
         nf+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789750364; x=1790355164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=y6nMczNQ3DZBT2HE1Ncd8RUTZxVgA7izY3+gfm5mgsI=;
        b=Cz/gvV/O99KXjqM5cmXOW8+M9T8VrZo6pyvQLnI6+VOMtmOzlGGOYscaSarbGlFzIT
         3C9Fj0xG2fFOCS3aQlz7DSD2cDcx+S8bcbY8vFq77hprComqEl2sjFG03z1dcdq4HLFl
         9TZxoI0KJSjk7SqmXv5QnwQ0k69AgWLEtr1x7ahdbb7AAPpk7YFDjdwef77aHkwy7DPM
         l099Sfj8eTtET6FYrI1wdqkitB24OXgWh3ENrDu4QjFYdeHhCpJHfajT491K9q3XMijL
         fOfPaDD2zDJ2IFh3yVJ1bHmW3wlpT65Tn9F7/CParc0KWGlBVget0mN7E634jImFkA8j
         MVUw==
X-Forwarded-Encrypted: i=1; AKwUvBzalCflsDoIAMM5uVXvxQ+A7WTCje5VfiDt0OyNj2GNdrMUdBc9y2NI23GzPfQoH0Y1YW8=@lists.linux.dev
X-Gm-Message-State: AFuF++nUoA0q2uIaOdcWgZT+jKZDA0mh5wkDsz0jhnyKvuRiUsplp9nn
	rh5QutGKOBD+UfgQXn79C9hiV9y3SOKmd5Zx1tZTFdyCK4yJRw+1n2kqL9h7B1pGshE=
X-Gm-Gg: AYBFou3l7GD55doSEUlv3RYe2DZjkSYUgerpQIerIHUpwuKvKBPL+OusBX29ftVWCHZ
	/Pdf0gnWVDTcqbdIfb6BESolebX/WTXq5Rwvmgz5qPO3/RL0M96k7LvFJOtZWhpoRhHNk/KDUaX
	hrwbwVgUQ8DSV5eK0DEd4eSsYQlotJdy987V0CeXwYNdcc8mR7ajBX5SGTqiD/BHF7omyom5jws
	pbZkMCl7EJqAhnYLMofdSdtFzrIdgNP9SpGuAxPtaB8+aBqJq89HSUXPZzESN2gSJVf9rBzuioB
	R9ef4wb6vCBaf9wtk2mqsXiooL98ObMACW6vcFCsIgfs0O8T94B562oiissCU8EEnNLMpOJBIQy
	nbwtKbhuCkGHKN64dd2tptkujqRcA5OHIAelslFYraX/qa4B8cSZOf9ykiZ+CoETcGoTEA3bQjZ
	5nruZvs0iM3FX6uCYFdUmqRP7nddw7GONy38msmHyTI5BXIid3kzjr9mJ51kxC0odSuJmgq3HDL
	Fs=
X-Received: by 2002:a05:620a:a40f:10b0:93b:eac0:ddd5 with SMTP id af79cd13be357-93beac0de5amr98270485a.51.1789750364309;
        Fri, 18 Sep 2026 09:52:44 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93be0f0762dsm183582785a.39.2026.09.18.09.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:52:44 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lee@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	abelvesa@kernel.org,
	kees@kernel.org,
	gustavoars@kernel.org,
	p.zabel@pengutronix.de
Cc: daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] arm64: dts: qcom: qcs6490-rb3gen2: add the clock controller
Date: Fri, 18 Sep 2026 11:52:33 -0500
Message-ID: <20260918165234.687224-5-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260918165234.687224-1-elder@riscstar.com>
References: <20260918165234.687224-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The clock (and reset) controller within the TC9564 SoC is accessed
via a PCI endpoint bus through BAR 4 of the first embedded PCIe
function.  A syscon node is created to provide access to a range
of memory that is used by the clock/reset controller and shared
by other devices.

Co-developed-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 22 +++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 5b7f5292a8864..a99ee153e2473 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -9,6 +9,7 @@
 #define PM7250B_SID 8
 #define PM7250B_SID1 9
 
+#include <dt-bindings/clock/toshiba,tc9564.h>
 #include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
 #include <dt-bindings/iio/qcom,spmi-adc7-pm7325.h>
 #include <dt-bindings/leds/common.h>
@@ -983,7 +984,7 @@ dev@0,1 {
 					 <0x2 0x0 0x0  0x83050100 0x0 0x4000  0x0 0x80000>,
 					 <0x4 0x0 0x0  0x83050100 0x0 0x84000  0x0 0x200000>;
 
-				pci-ep-bus@4 {
+				pcie_s1b5d0f0_bar4_bus: pci-ep-bus@4 {
 					compatible = "simple-bus";
 					#address-cells = <1>;
 					#size-cells = <1>;
@@ -995,6 +996,25 @@ pci-ep-bus@4 {
 	};
 };
 
+&pcie_s1b5d0f0_bar4_bus {
+	syscon@0 {
+		compatible = "toshiba,tc9564-config",
+			     "syscon",
+			     "simple-mfd";
+		reg = <0x0 0x2000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		tc9564_clock0: clock@1004 {
+			compatible = "toshiba,tc9564-clock";
+			reg = <0x1004 0x10>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+	};
+};
+
 &pm7325_gpios {
 	kypd_vol_up_n: kypd-vol-up-n-state {
 		pins = "gpio6";
-- 
2.53.0

